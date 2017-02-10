get '/yelp' do
  yp = YelpController.new
  @results = yp.find_matches(params[:name], params[:lat], params[:lon])
  # @chi_results = cfi.find_matches(params[:name])
  erb :"/reports/show"
end


post '/reports' do
  cfi = ChiFoodInspect.new
  @chi_results = cfi.find_matches(params[:name])
  erb :"/inspections/show"
end
