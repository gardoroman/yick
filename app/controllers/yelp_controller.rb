class YelpController
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

    #  params = { term: "Rosatti's Pizza",
    #             # name: "5544 N MILWAUKEE AVE",
    #             limit: 20
    #           }
    # coordinates = {latitude: 41.9028, longitude: -87.6953}
    # results = client.search_by_coordinates(coordinates, params)
    # puts "\n\n\n\n#{x}"

    client = Yelp::Client.new({
      consumer_key: ENV['YELP_CONSUMER_KEY'],
      consumer_secret: ENV['YELP_CONSUMER_SECRET'],
      token: ENV['YELP_TOKEN'],
      token_secret: ENV['YELP_TOKEN_SECRET']
      })

    results = client.search(location.capitalize, params)
    puts results

    results.businesses.each do |business|
      puts business.name
      puts business.rating
      puts business.location.address
    end

    return results
  end
end
