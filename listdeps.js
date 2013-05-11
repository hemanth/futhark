require('shelljs/global');
var os = require('os');
var sys = require('sys');
 
var os_type = os.type();
var installed = [];
var not_installed = [];
 
var deps = {
  curl      :  '',
  git       :  '',
  ruby      :  '1.8',
  node      :  '0.8',
  compass   :  '0.12',
  gem       :  '',
  phantomjs :  '',
  jpegtran  :  '',
  optipng   :  '',
  yeoman    :  '',
  clang     :  '',
  brew      :  ''
};
 
if(os_type == "Linux") {
  //This is Linux so remove Mac deps.
  delete deps['clang'];
  delete deps['brew'];
}
 
for(var dep in deps) {
  if (!which(dep)) {
    not_installed.push(dep);
  }
  else{
    if(deps[dep]){
      var version = exec(dep +' -v', {silent:true}).output;
      console.log(version);
      console.log(deps[dep]);
      if(version.search(deps[dep]) == -1){
        not_installed.push(dep); // Installed, but version mismatch.
      }
    }
    else{
      installed.push(dep);
    }
  }  
}
 
console.log(installed);
console.log(not_installed);
