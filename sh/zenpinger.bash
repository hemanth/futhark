#!/bin/bash

ZENITY=/usr/bin/zenity
IP_ADDR_VAL="global variable"


input_read() # FUNCTION to validate IPv4 addresses
{
	
host=$(${ZENITY}   --title  "Select  Host" --entry --text "IP of the host you would like to ping")
count=$(${ZENITY}   --title  "Number of pings" --entry --text "Count for ping , by default it's 5 ")

IP_ADDR_VAL=$(echo "$host" | grep -Ec '^(25[0-5]|2[0-4][0-9]|[01]?[0-9]{1,2})(\.(25[0-5]|2[0-4][0-9]|[01]?[0-9]{1,2})){3}$')
# echo $IP_ADDR_VAL

if [ $IP_ADDR_VAL == 0 ]; then
  zenity --info --text="*** Bad ip address: $host\nTry again with correct IP Address.\nNo data has been entered into DNS." 
  input_read
elif [ "$count" = "" ]; then 
        count=5
fi  

}

while true ; do
input_read
#ping -v -r -c $count $host | tee > (zenity --text-info) > res.txt | zenity --progress --auto-close 
#ping  -c $count $host  |tee > zenity --text-info > res.txt | zenity --progress --auto-close  
#ping -c $count $host | zenity --text-info > res.txt | cat res.txt > /dev/null |  zenity --width=400 --height=100 --progress --title="Pinging" --text="......." --percentage=0 
#ping -c $count $host  | (zenity --title="Pinging " --progress --pulsate --auto-close --text="Pinging........")
#cat res | zenity --text-info 
#ping  -c 5 127.0.0.1 > /tmp/res |zenity --progress ; zenity --info --text="(`cat /tmp/res` )"
#ping  -c 5 127.0.0.1 |tee>(zenity --progress)>/tmp/res ; zenity --info --text="(`cat /tmp/res` )"
# tail -f try.txt  2>/dev/null
ping  -c $count $host  |tee /tmp/res | ( zenity --width=400 --height=100 --progress --title="Pinging" --text="......." --percentage=0 ) ; zenity --info --text="(`cat /tmp/res` )"
answer=0;
answer=$( zenity --title  "More pings" --question --text="Do you want to ping more" --ok-label="Yes" --cancel-label="No")
echo $answer
if [ "$answer" = "0" ];then
echo "you have chosen to exit."
break
fi
done
