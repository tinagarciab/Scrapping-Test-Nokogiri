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

# Empty array where will be store all the craigslist Rent listing for Montreal 
rent_array = []


#Here is where de data is parsing
parse_page.css('.info').css('.title').map do |a|
	post_name = a.text
	rent_array.push(post_name)
end

# this will push your array into a CSV file
CSV.open('rent.csv', 'w') do |csv|
	csv << rent_array
end

Pry.start(binding)	