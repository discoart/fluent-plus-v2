const re1 = new RegExp('(?<![:.])s\\b', 'g');
console.log('(?<![:.])s\\\\b on "Names ":', 'Names '.match(re1));
console.log('(?<![:.])s\\\\b on "string ":', 'string '.match(re1));
console.log('(?<![:.])s\\\\b on "s ":', 's '.match(re1));

const re2 = new RegExp('(?<![:.])char\\b', 'g');
console.log('(?<![:.])char\\\\b on "string.char(":', 'string.char('.match(re2));

const re3 = new RegExp('(?<![:.])Name\\b', 'g');
console.log('(?<![:.])Name\\\\b on "Names =":', 'Names ='.match(re3));

const re4 = new RegExp('(?<![:.])str\\b', 'g');
console.log('(?<![:.])str\\\\b on "string ":', 'string '.match(re4));
console.log('(?<![:.])str\\\\b on "str ":', 'str '.match(re4));

console.log('\n--- checking "string" rename ---');
// If 'str' is NOT a local but something else...
// What if 's' gets renamed to 'bw', and 'tring' stays?
// No, that doesn't make sense.
// Let me check what 's' gets renamed to.

// Actually let me directly check: the issue might not be regex but the COLLECTION step
// Maybe 'string' IS being collected as a local by one of the regexes
const testCode = 'local Themes = { Names = { string.char(68,97,114,107) } }';
const reLocal = /local\s+(?:function\s+)?\b([a-zA-Z_]\w*)/g;
let m;
while ((m = reLocal.exec(testCode)) !== null) {
  console.log('Found local:', m[1]);
}
