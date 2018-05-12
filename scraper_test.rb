# Test Based on Nokogiri Tutorial 

require 'HTTParty'
require 'Nokogiri'
require 'Pry'
require 'csv'

#Request the page tahts ig going to scrape
page = HTTParty.get('https://www.kijiji.ca/b-maison-a-louer/grand-montreal/c43l80002?siteLocale=fr_CA')

#extract the HTML information of the page 
File.open("page.html", 'w') { |file| file.write(page) }


#Transform http response into a nokogiri object to parse it
parse_page= Nokogiri::HTML(page)

Pry.start(binding)
