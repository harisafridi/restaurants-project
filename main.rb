require 'sinatra' 
require 'slim'
require 'nokogiri'   
require 'open-uri'
$LOAD_PATH << '.'
require "crawl"
require "nearby"

#get '/:task' do

 # @task = params[:task].split('-').join(' ').capitalize
  #slim :task
#end
location ='ha8 6hl'

get '/' do
 @tasks = UtilNearby.nearby_list location

 slim :index
 end

post '/' do
  location = params[:task]
  redirect to('/')
end

get '/:task' do
 @tasks = UtilCrawl.reviews params[:task]
 @name = params[:task]
 slim :reviews
 end