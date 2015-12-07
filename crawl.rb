
require 'nokogiri' 
require "cgi"  
require 'open-uri'
$LOAD_PATH << '.'
require "nearby"

module UtilCrawl
def self.reviews location
	  array =[]
		restaurant_name =CGI.escape("#{location}")
		link = "https://www.google.co.uk/search?num=5&q=tripadvisor%20#{restaurant_name}"
		page = Nokogiri::HTML(open(link))
		search_find = page.css('h3[class=r] a[href]')
		get_search = search_find[0].to_s
		trim = get_search.split("=")[2]
		restaurant_link = trim.split("&amp")[0]
		page = Nokogiri::HTML(open(restaurant_link))
		review_links = page.css('div.pageNumbers a[href]')
	     review_links.each do |link| 
	     #puts link['href'] 
	     found = link['href']
	     page = Nokogiri::HTML(open("http://www.tripadvisor.co.uk#{found}"))
		   page.css("p[class=partial_entry]").each do |el|
		   array << el.text
       end
    array.shift
	  end
array
#count = page.css('a[property=reviewCount]')
#puts (count.text[0..1].to_i.round -1)/10
end
end