cat >> ~/.bashrc << "EOF"
getme(){
	if [[ $1 == avi && $2 != "" ]]; then
		url=$2
		filename=$(echo $url | cut -d"=" -f2)
		youtube-dl $url 
		ffmpeg -i $filename.flv $filename.avi
	else
		if [[ $1 == ogg && $2 != "" ]]; then
			url=$2
			filename=$(echo $url | cut -d"=" -f2)
			youtube-dl $url
			ffmpeg2theora -v 10 -S 0 -a 10 --sync $filename
		else
		  echo "Use getme <ogg/avi> <link>"
		fi
	fi 
}
EOF
