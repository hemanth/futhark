#!/usr/bin/env python
# Twitt Geo-location
# -*- coding: utf-8 -*-
# Geolocate.py
# Author Hemanth.HM
# Site : www.h3manth.com
# Licensed under GNU GPL Version 3

import twitter
import urllib2

""" USER SETTINGS """
USERNAME="your_twitter_name"
PASSWORD="your_twitter_password"

class Geolocate:
    """Class Geolocate to get the current geo-location and also twitt the same"""
    def get_info(self):
        """Returns the current location"""
        """ Query URI's """
        myip="http://whatismyip.org/"
        url="http://api.hostip.info/get_html.php?ip=%s&position=true"
        pub_ip = urllib2.urlopen(myip).read()
        url= url%(pub_ip)
        location = urllib2.urlopen(url).read()
        location = location.splitlines()
        del location[-1] # Remove ip for security.
        return " ".join(location)

    def twit(self):
        """Updates twitter status with current location, limitation 70 chars"""
        try:
                status = raw_input("Type in your status [70 chars]: ")
                twit = twitter.Api(username=USERNAME, password=PASSWORD)
                twit.PostUpdate(status+" "+self.get_info())
        except Exception, why:
                print str(why)

def main():
        wai = Geolocate()
        wai.twit()

if __name__ == "__main__":
    main()

