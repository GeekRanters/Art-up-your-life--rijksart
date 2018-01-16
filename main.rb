#https://www.rijksmuseum.nl/api/en/collection?key=YB4GHC25&format=json&imgonly=true

#https://www.rijksmuseum.nl/api/en/collection?key=YB4GHC25&format=json&imgonly=true&q=amersfoort

#request below returns detailed info on object
#https://www.rijksmuseum.nl/api/en/collection/RP-P-1885-A-9460?key=YB4GHC25&format=json


require 'sinatra'
require 'sinatra/reloader'
require 'HTTParty'
require_relative 'db_config'
require 'pry'
require_relative'models/artobject'
require_relative'models/tag'
require_relative'models/user'

enable :sessions

get '/' do
  erb :index
end

get '/query_input' do
  #principalMaker = params[:principalMaker]
  subject = params[:subject]
  #color = params[:color]
  art_query = "https://www.rijksmuseum.nl/api/en/collection?key=YB4GHC25&format=json&imgonly=true&q=#{subject}"
  @response_object = HTTParty.get(art_query)

  @art_results = []
  @response_object["artObjects"].each do |artwork|


    @name = artwork["title"]
    @objectNumber = artwork["objectNumber"]
    @principalMaker = artwork["principalOrFirstMaker"]


    @art_results.push({name: @name, objectNumber: @objectNumber, principalMaker: @principalMaker})
  end

  erb :results
end

get '/about' do
  erb :about
end

get '/landing' do
  erb :landing
end

get '/lounge' do
  erb :lounge
end

get '/bedroom' do
  erb :bedroom
end

get '/detail' do
  detail_query = "https://www.rijksmuseum.nl/api/en/collection/#{@objectNumber}?key=YB4GHC25&format=json"
  @detail = HTTParty.get(detail_query)
  @webImage = @detail["artObject"]["webImage"]["url"]
end
