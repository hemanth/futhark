#!/bin/bash
#===============================================================================
#
#          FILE:  orcale.sh
# 
#         USAGE:  ./orcale.sh 
# 
#   DESCRIPTION:  Script to install Orcale 
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Hemanth H.M (), hemanth.hm@gmail.com
#       COMPANY:  ---
#       VERSION:  1.0
#       CREATED:  04/20/2010 11:26:47 PM IST
#      REVISION:  1
#===============================================================================

sudo sh -c 'echo "deb http://oss.oracle.com/debian unstable main non-free" >> /etc/apt/sources.list'
wget http://oss.oracle.com/el4/RPM-GPG-KEY-oracle -O- | sudo apt-key add -
sudo apt-get update
sudo apt-get install oracle-xe
sudo /etc/init.d/oracle-xe configure
cat >> $HOME/.bashrc << 'EOF'
ORACLE_HOME=/usr/lib/oracle/xe/app/oracle/product/10.2.0/server
PATH=$PATH:$ORACLE_HOME/bin
export ORACLE_HOME
export ORACLE_SID=XE
EOF
#To test if its working fine 
#Log in as database admin : sqlplus sys as sysdba

