require 'soda/client'

class ChiFoodInspect
  def find_matches(name)

    # params = { :aka_name => name }

    
    client = SODA::Client.new({:domain => "data.cityofchicago.org", :app_token => ENV["SOCRATA_TOKEN"]})

    results = client.get("4ijn-s7e5", {:aka_name => name, :$limit => 5})
    # results = client.get("4ijn-s7e5", {"$where" => " results = 'pass'", :$limit => 20})
    #
    # p results.count
    # p results[0].class
    # p results[0].aka_name
    # puts "Got #{results.count} results. Dumping first results:"
    # results.each do |k, v|
    #     puts "#{k}: #{v}"
    #
    # # puts results[3].inspection_date
    # end

  end
end
