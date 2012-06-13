function notify(text) { 
span=document.body.appendChild(document.createElement('span')); 
span.innerHTML=text;
span.style.cssText="z-index:99;font-size:18px;background:#FFF1A8;top:0";
span.style.position='fixed';
span.style.left=((document.body.clientWidth - span.clientWidth) / 2)+"px"; 
window.setTimeout(function(){document.body.removeChild(span)}, 3000)
}
 
window.addEventListener('online',function(evt) { 
    notify("And....we are back!"); 
});
 
window.addEventListener('offline',function(evt) { 
    notify("OOPS....you are offline!"); 
});
