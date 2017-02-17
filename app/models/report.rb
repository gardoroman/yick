require 'oauth'
require 'httparty'
require 'yelp'


# The Report class conists of records returned from
# a lookup of the City of Chicago Food Inspection API.
# This class will be augmented with data from the Yelp API.
class Report

  attr_accessor :inspections

  def initialize(inspections)
    @inspections = inspections
  end

  def create_report_data(yelp_api)
    restaurants = []
    @inspections.each do |inspection|
      restaurant_hash = Hash.new
      restaurant_hash[:name] = inspection.aka_name
      restaurant_hash[:inspection_date] = inspection.inspection_date
      restaurant_hash[:results] = inspection.results
      restaurant_hash[:risk] = inspection.risk
      restaurant_hash[:address] = inspection.address
      restaurant_hash[:violations] = inspection.violations
      coordinates = {latitude: inspection.location.latitude, longitude: inspection.location.longitude}
      params = {term: inspection.aka_name, limit: 1}
      yelp_result = yelp_api.client.search_by_coordinates(coordinates, params)
      restaurant_hash[:yelp_rating] = yelp_result.businesses[0].rating
      restaurant_hash[:yelp_url] = yelp_result.businesses[0].url
      restaurants << restaurant_hash
    end
    restaurants
  end

end
