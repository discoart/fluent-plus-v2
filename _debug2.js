const fs = require('fs');
const path = require('path');

const seen = new Set();
const chunks = [];

function resolveModule(name, fromDir) {
  const base = path.join(fromDir, name.replace(/\./g, path.sep));
  if (fs.existsSync(base + '.luau')) return base + '.luau';
  if (fs.existsSync(base + '.lua')) return base + '.lua';
  if (fs.existsSync(path.join(base, 'init.luau'))) return path.join(base, 'init.luau');
  if (fs.existsSync(path.join(base, 'init.lua'))) return path.join(base, 'init.lua');
  return null;
}

function bundle(filePath) {
  const absPath = path.resolve(filePath);
  if (seen.has(absPath)) return;
  seen.add(absPath);
  let content = fs.readFileSync(absPath, 'utf-8');
  const dir = path.dirname(absPath);
  content = content.replace(/require\(["']([^"']+)["']\)/g, (match, mod) => {
    const resolved = resolveModule(mod, dir);
    if (resolved) bundle(resolved);
    return '';
  });
  chunks.push(content);
}

bundle(path.resolve('src/entry.lua'));
let code = chunks.join('\n');
code = code.replace(/--\[\[[\s\S]*?\]\]/g, '');
code = code.replace(/--[^\r\n]*/g, '');

code = code.replace(/"((?:[^"\\]|\\.)*)"|'((?:[^'\\]|\\.)*)'/g, (match, dq, sq) => {
  const content = dq != null ? dq : sq;
  if (content.length < 4) return match;
  const chars = [];
  for (let i = 0; i < content.length; i++) chars.push(content.charCodeAt(i));
  if (chars.length <= 60) return 'string.char(' + chars.join(',') + ')';
  return '(function()local s=""for _,v in ipairs{' + chars.join(',') + '}do s=s..string.char(v)end;return s end)()';
});

const KEYWORDS = new Set(['and','break','do','else','elseif','end','false','for','function','goto','if','in','local','nil','not','or','repeat','return','then','true','until','while']);

const names = new Set();

let re1 = /local\s+(?:function\s+)?\b([a-zA-Z_]\w*)/g;
let m;
while ((m = re1.exec(code)) !== null) { if (!KEYWORDS.has(m[1]) && m[1] !== 'self' && m[1] !== '_') names.add(m[1]); }

let re2 = /local\s+([a-zA-Z_]\w*(?:\s*,\s*[a-zA-Z_]\w*)*)\s*[=:=]/g;
while ((m = re2.exec(code)) !== null) { m[1].split(',').forEach(p => { const t = p.trim(); if (t && t !== 'self' && t !== '_' && !KEYWORDS.has(t)) names.add(t); }); }

let re3 = /function\s*(?:\w+\s*)?\(([^)]*)\)/g;
while ((m = re3.exec(code)) !== null) { m[1].split(',').forEach(p => { const t = p.trim(); if (t && t !== 'self' && !KEYWORDS.has(t)) names.add(t); }); }

let re4 = /for\s+([a-zA-Z_]\w*)\s*=/g;
while ((m = re4.exec(code)) !== null) { if (!KEYWORDS.has(m[1])) names.add(m[1]); }

let re5 = /for\s+([a-zA-Z_]\w*)(?:\s*,\s*([a-zA-Z_]\w*))?\s+in/g;
while ((m = re5.exec(code)) !== null) { if (m[1] && !KEYWORDS.has(m[1]) && m[1] !== '_') names.add(m[1]); if (m[2] && !KEYWORDS.has(m[2]) && m[2] !== '_') names.add(m[2]); }

const sorted = [...names].sort();
console.log('Total locals:', sorted.length);

const interesting = ['S', 's', 'Name', 'name', 'Names', 'string', 'String', 'char', 'char'];
for (const n of interesting) {
  if (names.has(n)) console.log('  "' + n + '" IS a local');
}

let shortName = (idx) => {
  const c = 'abcdefghijklmnopqrstuvwxyz';
  let name = '';
  do { name = c[idx % 26] + name; idx = Math.floor(idx / 26) - 1; } while (idx >= 0);
  return name;
};

const nameArr = [...names];
const fnMap = {};
for (let i = 0; i < nameArr.length; i++) {
  let idx = i;
  let sn;
  do { sn = shortName(idx++); } while (KEYWORDS.has(sn));
  fnMap[nameArr[i]] = { idx: i, short: sn };
}

for (const n of ['Names', 'name', 'Name', 'S', 'string', 'char']) {
  if (fnMap[n]) console.log('  "' + n + '" #' + fnMap[n].idx + ' -> "' + fnMap[n].short + '"');
  else console.log('  "' + n + '" is NOT being renamed');
}

console.log('\nTest regex on "string.char(68,97,114,107)":');
const test = 'string.char(68,97,114,107)';
for (const n of ['string', 'char', 'S', 'Name']) {
  if (fnMap[n]) {
    const re = new RegExp('(?<![:.])' + n + '\\b', 'g');
    console.log('  (?<![:.])' + n + '\\b   matches:', test.match(re));
  }
}
