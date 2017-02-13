class YelpApi

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

  def find_matches(location, search_term)
    # client = Yelp::Client.new({ consumer_key: '',
    #                             consumer_secret: '',
    #                             token: '',
    #                             token_secret: ''
    #                           })

    params = { term: search_term,
               # name: "5544 N MILWAUKEE AVE",
               limit: 20
             }


    results = @client.search(location.capitalize, params)
    puts results

    results.businesses.each do |business|
      puts business.name
      puts business.rating
      puts business.location.address
    end

    return results
  end
end
