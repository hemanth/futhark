# Get sunset and sunrise stats from terminal
function sunrise() { curl -sA Mozilla http://www.google.com/search?q=sunrise+$1 \
| html2text -width 80 \
| sed -n '10s/^ \{45\}//p';}

function sunset() { curl -sA Mozilla http://www.google.com/search?q=sunset+$1 \
| html2text -width 80  \
| sed -n '/from now/s/^ \{44\}//p'; }
