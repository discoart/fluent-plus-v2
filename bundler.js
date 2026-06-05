const fs = require('fs');
const path = require('path');

const entry = process.argv[2];
const output = process.argv[3];
const srcDir = path.resolve('src');

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
    if (resolved) {
      bundle(resolved);
    }
    return '';
  });

  chunks.push(content);
}

bundle(path.resolve(entry));
fs.mkdirSync(path.dirname(path.resolve(output)), { recursive: true });
fs.writeFileSync(path.resolve(output), chunks.join('\n'));
console.log('Bundled to', output);
