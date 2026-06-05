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
    for (let i = 0; i < content.length; i++) {
      chars.push(content.charCodeAt(i));
    }
    if (chars.length <= 60) {
      return 'string.char(' + chars.join(',') + ')';
    }
    return '(function()local s=""for _,v in ipairs{' + chars.join(',') + '}do s=s..string.char(v)end;return s end)()';
  });
}

function minify(code) {
  code = code.replace(/--\[\[[\s\S]*?\]\]/g, '');
  code = code.replace(/--[^\r\n]*/g, '');
  code = code.replace(/\r\n/g, '\n');
  code = code.replace(/\n{3,}/g, '\n\n');
  code = code.replace(/[ \t]+$/gm, '');
  return code.trim();
}

bundle(path.resolve(entry));
let combined = chunks.join('\n');
combined = obfuscateStrings(combined);
combined = minify(combined);
combined = BANNER + '\n\n' + combined;

fs.mkdirSync(path.dirname(path.resolve(output)), { recursive: true });
fs.writeFileSync(path.resolve(output), combined);
const size = (Buffer.byteLength(combined, 'utf-8') / 1024).toFixed(1);
console.log('Bundled to', output, `(${size} KB)`);
