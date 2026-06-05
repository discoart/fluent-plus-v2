const fs = require('fs');
const path = require('path');

const entry = process.argv[2];
const output = process.argv[3];
const version = process.argv[4] || 'dev';

const seen = new Set();
const chunks = [];

const BANNER = `--[[
███████╗██╗░░░░░██╗░░░██╗███████╗███╗░░██╗████████╗  ██████╗░██╗░░░░░██╗░░░██╗░██████╗
██╔════╝██║░░░░░██║░░░██║██╔════╝████╗░██║╚══██╔══╝  ██╔══██╗██║░░░░░██║░░░██║██╔════╝
█████╗░░██║░░░░░██║░░░██║█████╗░░██╔██╗██║░░░██║░░░  ██████╔╝██║░░░░░██║░░░██║╚█████╗░
██╔══╝░░██║░░░░░██║░░░██║██╔══╝░░██║╚████║░░░██║░░░  ██╔═══╝░██║░░░░░██║░░░██║░╚═══██╗
██║░░░░░███████╗╚██████╔╝███████╗██║░╚███║░░░██║░░░  ██║░░░░░███████╗╚██████╔╝██████╔╝
╚═╝░░░░░╚══════╝░╚═════╝░╚══════╝╚═╝░░╚══╝░░░╚═╝░░░  ╚═╝░░░░░╚══════╝░╚═════╝░╚═════╝░

Fluent Plus ${version}
https://fluent-pl.us
]]--`;

const KEYWORDS = new Set([
  'and', 'break', 'do', 'else', 'elseif', 'end', 'false', 'for', 'function',
  'goto', 'if', 'in', 'local', 'nil', 'not', 'or', 'repeat', 'return', 'then',
  'true', 'until', 'while'
]);

function shortName(index) {
  const c = 'abcdefghijklmnopqrstuvwxyz';
  let name = '';
  do {
    name = c[index % 26] + name;
    index = Math.floor(index / 26) - 1;
  } while (index >= 0);
  return name;
}

function collectLocals(code) {
  const names = [];
  const seen = new Set();
  function add(name) {
    if (!/^[a-zA-Z_]\w*$/.test(name)) return;
    if (KEYWORDS.has(name)) return;
    if (name === 'self' || name === '_') return;
    if (!seen.has(name)) { seen.add(name); names.push(name); }
  }
  let m;
  const re1 = /local\s+(?:function\s+)?\b([a-zA-Z_]\w*)/g;
  while ((m = re1.exec(code))) add(m[1]);
  const re2 = /local\s+([a-zA-Z_]\w*(?:\s*,\s*[a-zA-Z_]\w*)*)\s*[=:=]/g;
  while ((m = re2.exec(code))) {
    m[1].split(',').forEach(p => { const t = p.trim(); if (t) add(t); });
  }
  const simple = /local\s+([a-zA-Z_]\w*(?:\s*,\s*[a-zA-Z_]\w*)+)(?!\s*[=:=])/g;
  while ((m = simple.exec(code))) {
    m[1].split(',').forEach(p => { const t = p.trim(); if (t) add(t); });
  }
  const re3 = /function\s*(?:\w+\s*)?\(([^)]*)\)/g;
  while ((m = re3.exec(code))) {
    m[1].split(',').forEach(p => { const t = p.trim(); if (t && t !== 'self') add(t); });
  }
  const re4 = /for\s+([a-zA-Z_]\w*)\s*=/g;
  while ((m = re4.exec(code))) add(m[1]);
  const re5 = /for\s+([a-zA-Z_]\w*)(?:\s*,\s*([a-zA-Z_]\w*))?\s+in/g;
  while ((m = re5.exec(code))) { add(m[1]); if (m[2]) add(m[2]); }
  return [...new Set(names)];
}

function buildRenameMap(names) {
  const map = {};
  let idx = 0;
  for (const name of names) {
    let sn;
    do { sn = shortName(idx++); } while (KEYWORDS.has(sn));
    map[name] = sn;
  }
  return map;
}

function renameVars(code, map) {
  const names = Object.keys(map).sort((a, b) => b.length - a.length);
  let result = code;
  for (const name of names) {
    const re = new RegExp('(?<![:.])\\b' + name + '\\b', 'g');
    result = result.replace(re, map[name]);
  }
  return result;
}

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

function obfuscateStrings(code) {
  return code.replace(/"((?:[^"\\]|\\.)*)"|'((?:[^'\\]|\\.)*)'/g, (match, dq, sq) => {
    const content = dq != null ? dq : sq;
    if (content.length < 4) return match;
    const chars = [];
    for (let i = 0; i < content.length; i++) chars.push(content.charCodeAt(i));
    if (chars.length <= 60) return 'string.char(' + chars.join(',') + ')';
    return '(function()local s=""for _,v in ipairs{' + chars.join(',') + '}do s=s..string.char(v)end;return s end)()';
  });
}

function minify(code) {
  code = code.replace(/--\[\[[\s\S]*?\]\]/g, '');
  code = code.replace(/--[^\r\n]*/g, '');
  code = obfuscateStrings(code);
  const map = buildRenameMap(collectLocals(code));
  code = renameVars(code, map);
  code = code.replace(/\r\n/g, '\n');
  code = code.replace(/[ \t]+/g, ' ');
  code = code.replace(/\n+/g, '\n');
  code = code.replace(/\n/g, ' ');
  code = code.replace(/ +/g, ' ');
  return code.trim();
}

bundle(path.resolve(entry));
let combined = chunks.join('\n');
combined = minify(combined);
combined = BANNER + '\n\n' + combined;

fs.mkdirSync(path.dirname(path.resolve(output)), { recursive: true });
fs.writeFileSync(path.resolve(output), combined);
const size = (Buffer.byteLength(combined, 'utf-8') / 1024).toFixed(1);
console.log('Bundled to', output, `(${size} KB)`);
