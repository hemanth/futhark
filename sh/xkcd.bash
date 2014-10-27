#!/bin/bash

while [ 1 ]; do

# Remove old images if any!
rm -rf *.png

#Get the random image
wget $(curl -sL "http://dynamic.xkcd.com/random/comic/" \
    | grep "http://imgs.xkcd.com/comics/"\
    | awk -Fsrc=\" '{print $2}'\
    |awk -F\" '{print $1}') -O xkcd-$(date +'%S').png

#Set the image based on the desktop session

[[ $DESKTOP_SESSION == "gnome"]] && gconftool-2 --type string --set \
/desktop/gnome/background/picture_filename ~/.xkcd/xkcd*.png

[[ $DESKTOP_SESSION == "kde" ]] &&  dcop kdesktop KBackgroundIface \
setWallpaper xkcd*.png 1

#Have a nap
sleep 3600
