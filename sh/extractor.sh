#!/bin/bash
#===============================================================================
#
#          FILE:  extractor.sh
# 
#         USAGE:  ./extractor.sh 
# 
#   DESCRIPTION:  
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Hemanth H.M (), hemanth.hm@gmail.com
#       COMPANY:  ---
#       VERSION:  1.0
#       CREATED:  04/21/2010 08:44:22 AM IST
#      REVISION:  ---
#===============================================================================

# Test if the program is installed
unset check 2>/dev/null
check()
{
	type -P $1 &>/dev/null || echo $1 not installed! ; exit 1;
}

# Try to extract the file
unset extract 2>/dev/null
extract()
{
	if [ -f $1 ] ; then #Check for the file
	case $1 in
		*.tar) tar xvf $1
		check tar
		;;
		*.tbz2) tar xvjf $1
		check tar
		;;
		*.tgz) tar xvzf $1
		check tar
		;;
		*.tar.bz2) tar xvjf $1
		check tar
		;;
		*.tar.gz) tar xvzf $1
		check tar
		;;
		*.bz2) bunzip2 $1
		check bunzip2
		;;
		*.rar) unrar x $1
		check unrar
		;;
		*.gz) gunzip $1
		check gunzip
		;;
		*.zip) unzip $1
		check unzip
		;;
		*.Z) uncompress $1
		;;
		*.7z) 7z x $1
		check 7z
		;;
		*) echo "'$1' Cant be extracted" ;;
	esac
	else
		echo "'$1' is not a valid file"
	fi
}
extract $1
