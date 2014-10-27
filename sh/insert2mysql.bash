#!/bin/bash
#==================================================================
#
#          FILE:  insertDb.sh
# 
#         USAGE:  ./insert.sh 
# 
#   DESCRIPTION:  Illustration of inserted data from text to DB 
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Hemanth H.M (), hemanth.hm@gmail.com
#       VERSION:  1.0
#       CREATED:  03/06/2010 12:30:36 AM IST
#      REVISION:  ---
#=================================================================#
#Example scenario assume a list with words and meanings with space #as IFS
#or you have two files with words in one of them and #menaings in the other. 
#sed -e 's/ /#/' list | awk -F "#" '{print $1}' > words
#sed -e 's/ /#/' list | awk -F "#" '{print $2}' > means
 
while read f1 <&7
do
	read f2 <&8
	mysql -uroot -proot dict <<< "insert into words values ('$f1','$f2');"
# dict is the table
 
done \
7<words \
8<means
