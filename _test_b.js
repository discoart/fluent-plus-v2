const fs = require('fs');
const path = require('path');

const entry = process.argv[2];
const output = process.argv[3];
const version = process.argv[4] || 'dev';

const seen = new Set();
const chunks = [];
const entryPath = path.resolve(entry);

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
  const allMatches = [];
  function scan(re, extract) {
    re.lastIndex = 0;
    let m;
    while ((m = re.exec(code)) !== null) {
      extract(m).forEach(n => { if (n) allMatches.push({ name: n, pos: m.index }); });
    }
  }
  scan(/local\s+(?:function\s+)?\b([a-zA-Z_]\w*)/g, m => [m[1]]);
  scan(/local\s+([a-zA-Z_]\w*(?:\s*,\s*[a-zA-Z_]\w*)*)\s*[=:=]/g, m => m[1].split(',').map(p => p.trim()));
  scan(/local\s+([a-zA-Z_]\w*(?:\s*,\s*[a-zA-Z_]\w*)+)(?!\s*[=:=])/g, m => m[1].split(',').map(p => p.trim()));
  scan(/function\s*(?:\w+\s*)?\(([^)]*)\)/g, m => m[1].split(',').map(p => p.trim()).filter(t => t !== 'self'));
  scan(/for\s+([a-zA-Z_]\w*)\s*=/g, m => [m[1]]);
  scan(/for\s+([a-zA-Z_]\w*)(?:\s*,\s*([a-zA-Z_]\w*))?\s+in/g, m => [m[1], m[2]].filter(Boolean));
  allMatches.sort((a, b) => a.pos - b.pos);
  const entryChunk = chunks[chunks.length - 1] || '';
  if (entryChunk) {
    const entryLocals = [];
    const entrySeen = new Set();
    function eAdd(name) {
      if (!/^[a-zA-Z_]\w*$/.test(name)) return;
      if (KEYWORDS.has(name)) return;
      if (name === 'self' || name === '_') return;
      if (!entrySeen.has(name)) { entrySeen.add(name); entryLocals.push(name); }
    }
    const e1 = /local\s+(?:function\s+)?\b([a-zA-Z_]\w*)/g;
    let m;
    while ((m = e1.exec(entryChunk))) eAdd(m[1]);
    const e2 = /local\s+([a-zA-Z_]\w*(?:\s*,\s*[a-zA-Z_]\w*)*)\s*[=:=]/g;
    while ((m = e2.exec(entryChunk))) m[1].split(',').forEach(p => eAdd(p.trim()));
    const e3 = /function\s*(?:\w+\s*)?\(([^)]*)\)/g;
    while ((m = e3.exec(entryChunk))) m[1].split(',').forEach(p => { const t = p.trim(); if (t && t !== 'self') eAdd(t); });
    entryLocals.forEach(n => add(n));
  }
  allMatches.forEach(({ name }) => add(name));
  return names;
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
  const escaped = names.map(n => n.replace(/[.*+?^${}()|[\]\\]/g, '\\$&'));
  const re = new RegExp('(?<![:.])\\b(' + escaped.join('|') + ')\\b', 'g');
  return code.replace(re, (match) => map[match] || match);
}

function resolveModule(name, fromDir) {
  const base = path.join(fromDir, name.replace(/\./g, path.sep));
  if (fs.existsSync(base + '.luau')) return base + '.luau';
  if (fs.existsSync(base + '.lua')) return base + '.lua';
  if (fs.existsSync(path.join(base, 'init.luau'))) return path.join(base, 'init.luau');
  if (fs.existsSync(path.join(base, 'init.lua'))) return path.join(base, 'init.lua');
  return null;
}

function processModule(filePath, modName) {
  const absPath = path.resolve(filePath);
  if (seen.has(absPath)) return;
  seen.add(absPath);

  let content = fs.readFileSync(absPath, 'utf-8');
  const dir = path.dirname(absPath);

  content = content.replace(/require\(["']([^"']+)["']\)/g, (match, mod) => {
    const resolved = resolveModule(mod, dir);
    if (resolved) {
      processModule(resolved, mod);
      return '_G.__modules["' + mod + '"]';
    }
    return 'nil';
  });

  if (absPath === entryPath) {
    chunks.push(content);
    return;
  }

  content = content.replace(/\n\s*return\s+([^\n]+)\s*$/, (match, retLine) => {
    const vals = retLine.split(',').map(v => v.trim());
    if (vals.length <= 1) {
      return '\n_G.__modules["' + modName + '"] = ' + (vals[0] || 'nil');
    }
    return '\n' + vals.map((v, i) => '_G.__modules["' + modName + '_' + i + '"] = ' + v).join('\n');
  });

  content = 'do -- ' + modName + '\n' + content + '\nend';
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
  const map = buildRenameMap(collectLocals(code));
  code = renameVars(code, map);
  code = code.replace(/\r\n/g, '\n');
  code = code.replace(/[ \t]+/g, ' ');
  code = code.replace(/\n+/g, '\n');
  code = code.replace(/\n/g, ' ');
  code = code.replace(/ +/g, ' ');
  const _modRefs = [];
  code = code.replace(/_G\.__modules\["([^"]+)"\]/g, (m) => { _modRefs.push(m); return '___M' + (_modRefs.length - 1) + '___'; });
  code = obfuscateStrings(code);
  code = code.replace(/___M(\d+)___/g, (_, n) => _modRefs[+n]);
  return code.trim();
}

processModule(entryPath, '__entry');
let combined = '_G.__modules = _G.__modules or {}\n' + chunks.join('\n');

combined = combined.replace(
  /local\s+(\w+(?:\s*,\s*\w+)*)\s*=\s*_G\.__modules\["(\w+)"\]/g,
  (match, vars, modName) => {
    const varNames = vars.split(',').map(v => v.trim());
    if (varNames.length <= 1) return match;
    return varNames.map((v, i) => 'local ' + v + ' = _G.__modules["' + modName + '_' + i + '"]').join('\n');
  }
);

combined = minify(combined);
combined = BANNER + '\n\n' + combined;

fs.mkdirSync(path.dirname(path.resolve(output)), { recursive: true });
fs.writeFileSync(path.resolve(output), combined);
const size = (Buffer.byteLength(combined, 'utf-8') / 1024).toFixed(1);
console.log('Bundled to', output, `(${size} KB)`);

console.log("ENTRY:",JSON.stringify(chunks[chunks.length-1].slice(0,200)));