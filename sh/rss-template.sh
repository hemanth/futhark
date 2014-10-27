#!/bin/bash
#===============================================================================
#
#          FILE:  rss.sh
# 
#         USAGE:  ./rss.sh 
# 
#   DESCRIPTION:  The idea is pretty native :
#	                Step 1 : Get the rss feed URL
#									Step 2 : Scrap for the data
#									Step 3 : Set the data as wallpaper 
# 
#       OPTIONS:  ---
#  REQUIREMENTS:	sudo apt-get install imagemagick curl 
#									An image file, its reffered to as rss.jpg here
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Hemanth H.M (), hemanth.hm@gmail.com
#       COMPANY:  ---
#       VERSION:  1.0
#       CREATED:  04/21/2010 12:04:25 AM IST
#      REVISION:  ---
#===============================================================================

convert -font helvetica -fill white -pointsize 36 -draw \
'text 500,500 "This is the data from the rss feed"' \
rss.jpg rss-current.jpg
while [ 1 ]; do
COUNTER=0
while [ $COUNTER -lt 10 ]; do
# grep for text as per your requiremnet
text=`curl -s $URL | grep CDATA`
cmd="convert -font helvetica -fill white -pointsize 40 -draw 'text 500,500 \"$text\"' rss.jpg rss-current.jpg"
eval $cmd
temp=$(stat -c%s black-current.jpg)
if [[ $temp > 1000 ]]
then
eval $cmd
break
fi
sleep 5
let COUNTER=COUNTER+1
done
sleep 3
done
