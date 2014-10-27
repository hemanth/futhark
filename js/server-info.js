var http = require('http');
var os = require('os');
var url = require('url');
http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  var call = url.parse(req.url).pathname.replace(/.*\/|\.[^.]*$/g, '');
  if( call === "all"){
       Object.keys(os).map(function(method) { res.write(method+":"+JSON.stringify(os[method](),2,true))+","; })
  }
  else{
      try{
          var resu = os[call]();
          res.write(JSON.stringify(resu),'utf8');
      }
      catch(e){
          res.end("Sorry, try on of : "+Object.keys(os).join(", "));
      }
  }
  res.end();
}).listen(1337, "localhost");
console.log('Server running at http://localhost:1337/');
