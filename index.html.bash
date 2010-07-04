#!/bin/bash
#Author  : Hemanth.HM
#Email   : hemanth.hm@gmail.com
#Purpose : To genrate index.html for a give directory.
#Usage  : bash index.sh <dir>
 
dir=$1
cwd=`pwd`
 
#Check for input 
[ -z ${dir} ] && echo "Usage : `basename $0` <dir>" && exit 1 || cd ${dir}
 
# In case the user gives the input as "."
[ "${dir}" == "." ] && dir=`pwd`
 
 
# Collect each file and add them to href's
INDEX=`ls -1 ${dir} | sed "s/^.*/      <li\>\<a\ href=\"&\"\>&\<\\/a\>\<\\/li\>/
 
# Create an index.html file
cat > index.html << EOI
<html>
    <head> 
        <style type="text/css">
            body { font-family: serif; }
            p { font-size: 13px; }
            h2 { font-size: 24px; 
                 font-style: italic;
               }
            ul { font-weight: bolder; }
 
            <title>Index of ${dir}</title>
        </style>
    </head>
    <body>
        <h2>Index of ${dir}</h2>
        <hr>
            <ui>$INDEX</ui>
        <hr>
    </body>
</html>
EOI
echo "Genrated index.html in ${dir}!"
cd $cwd
