#!/usr/bin/bash
# Author  : hemanth hemanth.hm@gmail.com
# License : GNU GPLv3
# Site : www.h3manth.com
# This script converts given / local time to other time zones

# To echo useage
function useage()
{
	echo "USEAGE : $0 [OPTION] <-z GMT,UTC,EDT,CST,MST,PST,IST> HH:MM"
}

function __print__()
{
date -d "$1" &> /dev/null 
if [[ $? == 0 ]];then
echo "Given time ${1:-00:00} in various time zones:"
echo "IST => $(date -d "$1 IST")"
echo "UTC => $(date -d "$1 UTC")"
echo "EST => $(date -d "$1 EST")"
echo "EDT => $(date -d "$1 EDT")"
echo "PST => $(date -d "$1 PST")"
echo "CST => $(date -d "$1 CST")"
echo "MST => $(date -d "$1 MST")"
else
echo invalid date $1 
fi
}

while [[ $1 == -* ]]; do
    case "$1" in
      -h|--help|-\?) useage; exit 0;;
      -z)[[ $# > 2 ]]&&shift && date -d "$*" &>/dev/null; [[ $? == 0 ]] && date -d "$*" || useage ;shift; exit 0 ;;
      --) shift; break;;
      -*) echo "invalid option: $1" 1>&2; useage; exit 1;;
    esac
done
	
if [[ $1 != -* ]]; then
   __print__ $1
fi

