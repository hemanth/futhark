#!/bin/bash
#Author : Hemanth H.M hemanth.hm@gmail.com
#Licence : GNU GPLv3
#Reading logs made easy with bash.

cdn() { 
    local file latest; 
    for file in "${1:-.}"/*; do 
        [[ $file -nt $latest ]] && latest=$file
    done; 
    printf '%s\n' "$latest"
    [[ -d $latest ]] && cd $latest || tailf $latest
} 

#Usage: cdn [dir]
#do add it to your ~/.bash.rc 
