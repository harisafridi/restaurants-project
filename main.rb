require 'sinatra' 
require 'slim'
require 'nokogiri'   
require 'open-uri'
$LOAD_PATH << '.'
require "crawl"
require "nearby"


location ='ha8 6hl'

get '/' do
 @names, @vicinity, @rating  = UtilNearby.nearby_list location
 slim :index
 end

post '/' do
  location = params[:address]
  redirect to('/')
end

get '/:task' do
 @reviews = UtilCrawl.reviews params[:task]
 @restaurantname = params[:task]
 slim :reviews
 end
