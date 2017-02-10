require 'soda/client'

class SocrataApi

  def initialize
    @client = SODA::Client.new({:domain => "data.cityofchicago.org", :app_token => ENV["SOCRATA_TOKEN"]})
  end

  def find_matches(name)
    formatted_name = yelp_lookup(name)
    results = @client.get("4ijn-s7e5", {:aka_name => formatted_name, :$limit => 5})
  end

  private

  def yelp_lookup(term)
    yelp_api = YelpApi.new
    yelp_api.formatted_name(term);
  end



end
