import fs from 'fs';
const c = fs.readFileSync('dist/bundle.lua', 'utf8');
const idx = c.lastIndexOf('__modules');
console.log('Last __modules at:', idx);
console.log(c.substring(Math.max(0, idx - 50), Math.min(c.length, idx + 200)));
