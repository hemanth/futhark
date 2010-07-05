#!/usr/bin/env python
# Twitt rss feeds
# gnews.py
# Author Hemanth.HM
# Site : www.h3manth.com
# Licensed under GNU GPL Version 3

import feedparser
import urllib2

class Googlenews:
	""" This class helps to fetch top news from specific catagories of Goog News"""
	def get_input(self):
		""" Prompts user to select his choice of news """
		try:
			print """ News feed list : \n
							1 .Top
							2 .World
							3 .Australia
							4 .Canada
							5 .India
							6 .Ireland
							7 .New
							8 .South
							9 .US
							10.UK
							11.Business
							12.Sci/Tech
							13.Health
							14.Sports
							15.Entertainment """
			news_type = int(raw_input("Which you you like to read : "))
			return news_type
		except ValueError:
			print 'Invalid input, please select a number for the list'
	
	def get_feed(self):
		""" Returns the feed type based on the users input """
		url="http://news.google.com/news?ned=%s&topic=%s&output=rss"
		links=[{"ned":"us", "type":"h"},
			   {"ned":"us", "type":"w"},
			   {"ned":"us", "type":"n"},
			   {"ned":"us", "type":"n"},
			   {"ned":"us", "type":"n"},
			   {"ned":"us", "type":"n"},
			   {"ned":"us", "type":"nz"},
			   {"ned":"us", "type":"sa"},
			   {"ned":"us", "type":"n"},
			   {"ned":"us", "type":"n"},
			   {"ned":"us", "type":"b"},
			   {"ned":"us", "type":"t"},
			   {"ned":"us", "type":"m"},
			   {"ned":"us", "type":"s"},
			   {"ned":"us", "type":"e"},
			  ]
		feed = links[self.get_input()]
		return url%(feed["ned"],feed["type"])
		
	def shrink(self,url):
		""" Shrink URI using the is.gd API """
		surl = "http://is.gd/api.php?longurl=%s"%(url)
		return urllib2.urlopen(surl).read()
		
	def gnews(self):
		""" Returns the top ten news of the selected section """
		feed_url = self.get_feed()
		feed_data = feedparser.parse(feed_url)
		for data in feed_data["items"]:
			print data["title"] + ":" + self.shrink(data["link"])

def main():
	""" The main block where all the action happens """
	news = Googlenews()
	news.gnews()
	
if __name__ == "__main__":
	main()

