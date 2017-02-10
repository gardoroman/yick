
require 'soda/client'
require 'oauth'

client = SODA::Client.new({:domain => "data.cityofchicago.org", :app_token => "XXXXXfill_inXXXXXX"})

results = client.get("4ijn-s7e5", {:aka_name => "POKIOLOGY", :$limit => 5})
# results = client.get("4ijn-s7e5", {"$where" => " results = 'pass'", :$limit => 20})
# , :$limit => 20
p results.count
p results[0].class
p results[0].aka_name
p results[0].address
p results[0].inspection_date
p results[0].risk
p results[0].results
p results[0].violations


# puts "Got #{results.count} results. Dumping first results:"
# results.each do |k, v|
#     puts "#{k}: #{v}"


# end


#parms that work
# - zip
# - results
# - aka_name
# - risk


#

# response = client.get("644b-gaut", {"$limit" => 1, :namelast => "WINFREY", :namefirst => "OPRAH"})
