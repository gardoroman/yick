require 'soda/client'

class ChiFoodInspect
  def find_matches(name)

    # params = { :aka_name => name }

    
    client = SODA::Client.new({:domain => "data.cityofchicago.org", :app_token => ENV["SOCRATA_TOKEN"]})

    results = client.get("4ijn-s7e5", {:aka_name => name, :$limit => 5})

    # checking output
    p results.count
    p results[0].class
    p results[0].aka_name
    p results[0].address
    p results[0].inspection_date
    p results[0].risk
    p results[0].results
    p results[0].violations

    results
  end
end
