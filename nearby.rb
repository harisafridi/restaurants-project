require 'google_places'
require 'geokit'

module UtilNearby
	
def self.nearby_list (address)
placearray = []	
vicinity = []
rating = []
api_key = 'AIzaSyBUPxjt4xnTRS3C147ATsO--Ipeyx5p5og'
a=Geokit::Geocoders::MultiGeocoder.geocode "#{address}"
#ip = Geokit::Geocoders::MultiGeocoder.geocode("80.2.127.113")
client = GooglePlaces::Client.new api_key
results =client.spots(a.latitude.to_f, a.longitude.to_f, :types => 'restaurant')
results.each do |place| 
	placearray << place['name'] 
	vicinity << place['vicinity']
	rating << place['rating']
end
return placearray, vicinity, rating
end
end
