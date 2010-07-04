#!/usr/bin/env ruby
# Author : Hemanth.HM 
# Site : www.h3manth.com
# rsstwit.rb
# License: GNU General Public License Version 3
# Requirments :
# Get twitter and feezirra gems 
# sudo apt-get install libcurl4-gnutls-dev 
# sudo apt-get install libxslt-dev libxml2-dev
# gem sources -a http://gems.github.com 
# sudo gem install pauldix-feedzirra nokogiri twitter 

require "rubygems"
require 'feedzirra'
require 'twitter'
require 'open-uri'

class Rsstwit
# def twitt
    def twitt
        # set feed_url
        feed_url = "http://www.h3manth.com/rss.xml"
        # fetch feed
        feed = Feedzirra::Feed.fetch_and_parse(feed_url)
        entry    = feed.entries.first
        title    = entry.title 
        link     = open('http://is.gd/api.php?longurl='\
        + entry.url , "UserAgent" => "Ruby-Wget").read
                status = title+":"+link
                
        # Grant access to twitter on website
        # and using request token to generate access token
        # As HTTP `raise_errors': (401): Unauthorized -  (Twitter::Unauthorized)

        oauth = Twitter::OAuth.new('consumer token', 'consumer secret')
        oauth.authorize_from_access('access token', 'access secret')
                client = Twitter::Base.new(oauth)
                client.update(status)
    end
end

# Create an instance 
feedtw = Rsstwit.new
# First twitt
feedtw.twitt()
# check for update and twit if new simple?
updated_feed = Feedzirra::Feed.update(feed)
if updated_feed.updated?
    feedtw.twitt
end
