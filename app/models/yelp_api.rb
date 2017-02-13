class YelpApi

  attr_accessor :client

  def initialize
    @client = Yelp::Client.new({
      consumer_key: ENV['YELP_CONSUMER_KEY'],
      consumer_secret: ENV['YELP_CONSUMER_SECRET'],
      token: ENV['YELP_TOKEN'],
      token_secret: ENV['YELP_TOKEN_SECRET']
      })

  end

  # The Yelp API allows for a more generous and relevant lookup
  # of restaurant names
  def formatted_name(name)
    params = {term: name, limit: 1}
    results = @client.search("Chicago", params)
    results.businesses[0].name.upcase
  end

end
