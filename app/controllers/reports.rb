get '/yelp' do
  yp = YelpController.new
  @results = yp.find_matches(params[:name], params[:lat], params[:lon])
  # @chi_results = cfi.find_matches(params[:name])
  erb :"/reports/show"
end


post '/reports' do
  # cfi = ChiFoodInspect.new

  socrata = SocrataApi.new
  @chi_results = socrata.find_matches(params[:name])
  erb :"/inspections/show"
end
