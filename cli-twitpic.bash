#!/bin/bash
#==================================================================
#
#          FILE:  cli-twitpic.bash
# 
#         USAGE:  ./cli-twitpic.bash 
# 
#   DESCRIPTION:  Allows you to upload pic from cli to twitpic and 
#									also update the same as you status in twitter
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Hemanth H.M (), hemanth.hm@gmail.com
#       VERSION:  1.0
#       CREATED:  03/06/2010 01:45:02 AM IST
#      REVISION:  ---
#=================================================================#

URL="http://twitpic.com/api/uploadAndPost"

# Fields to post in (post data should be formatted as multipart/form-data):
#- media (required) - Binary image data
#- username (required) - Twitter username
#- password (required) - Twitter password
#- message (optional) - Message to post to twitter. The URL of the #image is automatically added.

#Sample response:

#<?xml version="1.0" encoding="UTF-8"?>
#<rsp status="ok">
#<statusid>4567</statusid>
#<userid>4567</userid>
#<mediaid>hmh123</mediaid>
#<mediaurl>http://twitpic.com/hmh123</mediaurl>
#</rsp>

# Read input to an array BASHv4 only, other version tweak to code # to read -a to read it to normal array or use individual variables

# Declares an associative array called data
declare -A data

data[USER]=$1
data[PASS]=$2
data[PIC]="$3"
data[TWIT]=$4

# Validate inputs 
for key in USER PASS PIC TWIT; do
  [[ data[$key]="" ]] && echo "Enter $key:" && read  data[$key]
done

# Check if the pic file exists
[[ -f  ${data[PIC]} ]] || echo Error: FileNotFound ${data[PIC]} && exit 1

echo Uploading...
$CURL \
  --form username=$TWITTER_USER \
  --form password=$TWITTER_PW \
  --form media=@"$PHOTO" \
  --form message="$TWEET_MSG" $UPLOAD_URL

# Check if all went fine
[[ $? = 6 ]] && echo "Error will uploading! Check credentials" && exit 1
echo "Pic uploaded!" 
