#!/bin/bash
#Author : Hemanth H.M hemanth.hm@gmail.com
#Licence : GNU GPLv3
#Installs Google Go on ubuntu
# Save the pwd
cwd=`pwd`
# Set the env
cat >> ~/.profile  << EOT
export GOROOT=$HOME/go
export GOOS=linux
export GOARCH=`arch`
export GOBIN=$HOME/bin
EOT
# Set the Path
cat >> ~/.bashrc << EOT
export PATH=${PATH}:$GOBIN
EOT
# Source them
source ~/.profile
source ~/.bashrc
# Build deps 
sudo apt-get install python-setuptools python-dev build-essential mercurial bison gcc libc6-dev ed make
# Check out the source
hg clone -r release https://go.googlecode.com/hg/ $GOROOT
# Build the source
cd $GOROOT/src ; ./all.bash
# Get back 
cd $cwd
