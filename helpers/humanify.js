var path = require('path')
var fs = require('fs')

const files = fs.readdirSync('./features');
const beforePaths = files.filter(x => x.match(/\.hfeature$/))

console.log(JSON.stringify(beforePaths))

beforePaths.forEach(path => {
  const beforeFeature = fs.readFileSync('./features/' + path).toString();

  //this is the interesting part
  let replacements =
    []
      .concat(replaceAndPrepReverse(beforeFeature, /I navigate to (.*)/, "driver '$1'"))
      .concat(replaceAndPrepReverse(beforeFeature, /I wait/, "delay(2000)"))
      .concat(replaceAndPrepReverse(beforeFeature, /I go back/, "back()"))
      .concat(replaceAndPrepReverse(beforeFeature, /I click (.*)/, "click('$1')"))
      .concat(replaceAndPrepReverse(beforeFeature, /I type (.*) into (.*)/, "input('input[name=$2]', '$1')"))
      .concat(replaceAndPrepReverse(beforeFeature, /the page says (.*)/, "match html('body') contains '$1'"))


  let afterFeature = beforeFeature; 
  replacements.forEach(replacement => {
    afterFeature = afterFeature.replace(replacement[0], replacement[1])
  })
  fs.writeFileSync('./features/' + path.replace(/\.hfeature$/, '.feature'), afterFeature);
})

// for each one, do some find and replaces and generate a reverse script

function replaceAndPrepReverse (str, regexBefore, after) {
  var res = [];
  const matches = str.match(regexBefore); 
  matches.forEach(beforeStr => {
    const afterStr = beforeStr.replace(regexBefore, after)
    fs.appendFileSync('reverse.js.snip', '.replace("'+ beforeStr + '", "' + afterStr + '")');
    res.push([beforeStr, afterStr])
  })
  return res;
}
