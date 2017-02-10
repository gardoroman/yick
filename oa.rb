require 'oauth'
require 'json'
require 'yelp'
require 'httparty'

# consumer_key =
# consumer_secret =
# access_token =
# access_token_secret =

# @consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site=>'http://gardoroman.github.io'})
# accesstoken = OAuth::AccessToken.new(@consumer, access_token, access_token_secret)
client = Yelp::Client.new({ consumer_key: '',
                            consumer_secret: '',
                            token: '',
                            token_secret: ''
                          })

params = { term: "Rosatti's Pizza",
           # name: "5544 N MILWAUKEE AVE",
           limit: 20
         }
coordinates = {latitude: 41.9028, longitude: -87.6953}
# results = client.search_by_coordinates(coordinates, params)
# puts "\n\n\n\n#{x}"
results = client.search("Chicago", params)
puts results

results.businesses.each do |business|
  puts business.name
  puts business.rating
  puts business.location.address
end


