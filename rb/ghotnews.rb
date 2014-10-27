#!/usr/bin/env ruby
# Author : Hemanth.HM 
# Site : www.h3manth.com
# rsstwit.rb
# License: GNU General Public License Version 3
# Requirments :
# gem install nokogiri

require 'nokogiri'
require 'open-uri'   
 
hot_url = 'http://google.com/trends/hottrends/atom/hourly'
page = Nokogiri::HTML(open(hot_url))
p page.css('li').each {|x| p x.text}
