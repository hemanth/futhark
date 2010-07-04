#!/bin/bash

fad()
{
echo "$1" >> ~/.db
notify-send "Database Updated $@"
}

f()
{
  res=$(grep "$1" ~/.db) 
  echo "$res"
  notify-send "$res"
  echo "$res" | zenity --text-info
}

fuse()
{
 echo "f keyword to search"
 echo "f -add or f -a  to add "
}

case "$1" in
     
-a |-add |--add) fad "$2"
	;;
		
"") f "$*"
  ;;


*) fuse
  ;;

esac                                      
