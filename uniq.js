var words = document.body.textContent.split(/\s+/).sort.filter( function(v,i,o){return v!==o[i-1];});

