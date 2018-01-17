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
  principalMaker = params[:principalMaker]
  subject = params[:subject]
  color = params[:color]
  art_query = "https://www.rijksmuseum.nl/api/en/collection?key=YB4GHC25&format=json&imgonly=true&q=#{subject}&p=#{principalMaker}&f.normalized32Colors.hex=#{color}"
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

def show_detail(objectNumber)
  @objectNumber = params[:objectNumber]
  @detail_request = "https://www.rijksmuseum.nl/api/en/collection/#{@objectNumber}?key=YB4GHC25&format=json"
  @detail_result = HTTParty.get(@detail_request)
  @title = @detail_result["artObject"]["title"]
  @webImage = @detail_result["artObject"]["webImage"]["url"]
  @principalMaker = @detail_result["artObject"]["principalMaker"]
  @label = @detail_result["artObject"]["plaqueDescriptionEnglish"]
  @subject = @detail_result["artObject"]["classification"]["iconClassDescription"]
  @colors = @detail_result["artObject"]["colors"]
  erb :detail
end

get '/detail' do
  show_detail(params[:objectNumber])
end
