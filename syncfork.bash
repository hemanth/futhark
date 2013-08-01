#!/usr/bin/env bash
# Author : Hemanth.HM 
# License : MIT
# Some JSON parsing logic from http://l-o-n-g.livejournal.com/146422.html

# Get the current repo URL
url=$(git config --get remote.origin.url)

# Get the user and repo part from the URL 
# Must be something like part=${url#*//*/}
# Sticking to github specific code as of now.

part=${url#*github.com*/}

# ZOMG parse JSON using the github api get the parent git_url.
# would suggest to use curl -s .. | jq -r '.parent.git_url'  
upstream=$(curl -s https://api.github.com/repos/${part%.git} | sed -e 's/[{}]/''/g' | awk -v k="text" '{n=split($0,a,","); for (i=1; i<=n; i++) print a[i]}' | grep '"git_url":' | sed 's/:/ /1' | awk -F" " '{ print $2 }' | uniq | tail -1)

# Rest of it...
git remote add upstream $upstream
git checkout master
git pull --rebase
git push origin master
