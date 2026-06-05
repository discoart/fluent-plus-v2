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

const KEYWORDS = new Set(['and','break','do','else','elseif','end','false','for','function','goto','if','in','local','nil','not','or','repeat','return','then','true','until','while']);

const names = new Map(); // name -> how collected
function add(name, how) {
  if (!/^[a-zA-Z_]\w*$/.test(name)) return;
  if (KEYWORDS.has(name)) return;
  if (name === 'self' || name === '_') return;
  if (!names.has(name)) names.set(name, how);
}

let m;
const re1 = /local\s+(?:function\s+)?\b([a-zA-Z_]\w*)/g;
while ((m = re1.exec(code))) add(m[1], 'local decl');

const re2 = /local\s+([a-zA-Z_]\w*(?:\s*,\s*[a-zA-Z_]\w*)*)\s*[=:=]/g;
while ((m = re2.exec(code))) { m[1].split(',').forEach(p => { const t = p.trim(); if (t) add(t, 'local multi'); }); }

const re3 = /function\s*(?:\w+\s*)?\(([^)]*)\)/g;
while ((m = re3.exec(code))) { m[1].split(',').forEach(p => { const t = p.trim(); if (t && t !== 'self') add(t, 'function param'); }); }

const re4 = /for\s+([a-zA-Z_]\w*)\s*=/g;
while ((m = re4.exec(code))) add(m[1], 'for numeric');

const re5 = /for\s+([a-zA-Z_]\w*)(?:\s*,\s*([a-zA-Z_]\w*))?\s+in/g;
while ((m = re5.exec(code))) { add(m[1], 'for in'); if (m[2]) add(m[2], 'for in'); }

const s = new Map([...names.entries()].sort());
console.log('=== ALL LOCALS (sorted) ===');
let idx = 0;
for (const [name, how] of s) {
  if (name.startsWith('s') || name.startsWith('S') || name.startsWith('c') || name.startsWith('C') || name.startsWith('N') || name.startsWith('n')) {
    console.log(`  ${name} (${how})`);
  }
}
