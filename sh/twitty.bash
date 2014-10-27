#! /bin/bash
tweet()
{
	usr=$(zenity --entry --text="Username" --title="Twitt")
	pwd=$(zenity --entry --text="Password" --title="Twitt" --hide-text)
	msg=$(zenity --entry --text="Tweet" --title="Twitt")

	if [ "$usr" = "" ]; then
		zenity --info --text="UserName invalid"
		tweet
	elif [ "$pwd" = "" ]; then
		zenity --info --text="Invalid Password"
		tweet
	elif [ "$msg" = "" ]; then
		msg="www.h3manth.com"
	fi
}

tweet
URL="https://twitter.com/statuses/update.xml"
curl -u ${usr}:${pwd} -d status="${msg}" ${URL} -k -s > /dev/null

if [[ $? = 0 ]];
then
	zenity --error --text="You couldn't twitt , check if everything is fine " --title="Twitt"
	exit 0
else
	zenity --info --text="$msg is twitted" --title="Twitt"
	exit 1
fi