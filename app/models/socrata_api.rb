require 'soda/client'

class SocrataApi

  attr_accessor :yelp_client

  def initialize
    @client = SODA::Client.new({:domain => "data.cityofchicago.org", :app_token => ENV["SOCRATA_TOKEN"]})
  end

  def find_matches(name)
    formatted_name = yelp_lookup(name)
    results = @client.get("4ijn-s7e5", {:aka_name => formatted_name, :$limit => 10})
    restaurants = Report.new(results)
    restaurants.create_report_data(@yelp_client)
    results
  end

  private

  def yelp_lookup(term)
    @yelp_client = YelpApi.new
    @yelp_client.formatted_name(term);
  end



end
