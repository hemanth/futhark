#!/bin/bash
#Author : Hemanth H.M hemanth.hm@gmail.com
#Licence : GNU GPLv3
#Installs skipfish - web application security scanner

#Get libidn 
wget -qO - "http://ftp.gnu.org/gnu/libidn/libidn-1.18.tar.gz" | tar zxf - && cd cd libidn-1.18 && ./configure &&  make && sudo make install

#Get skifish
wget http://skipfish.googlecode.com/files/skipfish-1.05b.tgz | tar zxf - && cd skipfish && make

