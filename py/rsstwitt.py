#!/usr/bin/env python
# Twitt rss feeds
# rsstwitt.py
# Author Hemanth.HM
# Site : www.h3manth.com
# Licensed under GNU GPL Version 3

import feedparser
import urllib2
import twitter

class TweetFeeds:
     def __init__(self,feed,tuser,tpass):
        self.feed = feed
        self.tuser = tuser
        self.tpass = tpass

     def get_feed(self):
        """ Get feeds for the first time """
        return feedparser.parse(self.feed)

     def shrink(self,url):
        """ Shrink URL """
        surl = "http://is.gd/api.php?longurl=%s"%(url)
        return urllib2.urlopen(surl).read()

     def update(self):
        """ Check if there is a new feed """
        old_feed = self.get_feed ()
        """ etag = old_feed.etag or old_feed.modified based on the feed type """
        chk_feed = feedparser.parse(self.feed, modified=old_feed.modified )
        """ chk_feed.status equals 200 implies no new posts """
        if chk_feed.status == 200:
            print "No new posts in the feed to twitt"
            return False
        else:
            long_url=str(old_feed["items"][0]["link"])
            title=str(old_feed["items"][0]["title"])
            return (title+ " " +self.shrink(long_url))

     def twitt(self):
        """ Twitt if any new post """
        if (self.update()):
            try:
                twit = twitter.Api(username=self.tuser, password=self.tpass)
                if(self.update() != False):
                    twit.PostUpdate(self.update())
            except Exception, why:
                print str(why)

def main():
    """ Edit the url and tuser and tpass as per your requirments """
    feed="http://www.h3manth.com/rss.xml"
    tuser="hemanth_hm"
    tpass="**********"
    twitfeed = TweetFeeds(feed,tuser,tpass)
    twitfeed.twitt()
    
if __name__ == "__main__":
    main()
