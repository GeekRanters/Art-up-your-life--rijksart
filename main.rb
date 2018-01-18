#https://www.rijksmuseum.nl/api/en/collection?key=YB4GHC25&format=json&imgonly=true

#https://www.rijksmuseum.nl/api/en/collection?key=YB4GHC25&format=json&imgonly=true&q=amersfoort

#request below returns detailed info on object
#https://www.rijksmuseum.nl/api/en/collection/RP-P-1885-A-9460?key=YB4GHC25&format=json

require 'sinatra'
require "sinatra/reloader"
require 'httparty'
require 'pry'
require_relative 'db_config'
require_relative 'models/artobject'
require_relative 'models/tag'
require_relative 'models/user'
require_relative 'models/tag_artobject'
require_relative 'models/user_artobject'

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
    @objectnumber = artwork["objectNumber"]
    @art_results.push({name: @name, objectNumber: @objectnumber})
  end
  erb :results
end

get '/about' do
  erb :about
end

def show_detail(objectnumber)
  @objectnumber = objectnumber #params[:objectNumber]
  @detail_request = "https://www.rijksmuseum.nl/api/en/collection/#{@objectnumber}?key=YB4GHC25&format=json"
  @detail_result = HTTParty.get(@detail_request)
  @title = @detail_result["artObject"]["title"]
  @webImage = @detail_result["artObject"]["webImage"]["url"]
  @principalMaker = @detail_result["artObject"]["principalMaker"]
  @label = @detail_result["artObject"]["plaqueDescriptionEnglish"]
  erb :detail
end

get '/detail' do
  show_detail(params[:objectnumber])
end

def add_to_artobjects(objectnumber)
  artobject = Artobject.find_by(objectnumber:objectnumber)
  if artobject.nil?
    @detail_request = "https://www.rijksmuseum.nl/api/en/collection/#{objectnumber}?key=YB4GHC25&format=json"
    @detail_result = HTTParty.get(@detail_request)
    artobject=Artobject.new
    artobject.objectnumber=objectnumber
    artobject.principalmaker=@detail_result["artObject"]["principalMaker"]
    artobject.title=@detail_result["artObject"]["title"]
    artobject.description=@detail_result["artObject"]["plaqueDescriptionEnglish"]
    artobject.webimage=@detail_result["artObject"]["webImage"]["url"]
    artobject.museumurl="https://www.rijksmuseum.nl/en/collection/#{@objectnumber}"
    artobject.subject=@detail_result["artObject"]["classification"]["iconClassDescription"]
    artobject.colors=@detail_result["artObject"]["colors"]
    artobject.save
  end
end

def add_to_tag_artobjects(objectnumber, tag)
  # no check if relation already exists
  #t = TagArtobject.new
  t = Tag.find_by(label:tag)
  art_object = Artobject.find_by(objectnumber:objectnumber)
  t.artobjects.push(art_object)
  t.save
end

post '/tag_artobject' do
  add_to_artobjects(params[:objectnumber])
  add_to_tag_artobjects(params[:objectnumber], params[:tag])
  redirect "/tag?tag=#{params[:tag]}"
end

def add_to_user_artobjects(objectnumber)
  art_object=Artobject.find_by(objectnumber:objectnumber)
  current_user.artobjects << art_object
end

post '/user_artobject' do
  add_to_artobjects(params[:objectnumber])
  add_to_user_artobjects(params[:objectnumber])
  redirect '/favourites'
end

get '/favourites' do
  @favourites_for_current_user = User.find_by(id:current_user.id).artobjects.reverse
  erb :favourites
end

get '/tag' do
  @tag_label=params[:tag]
  @tagresults = Tag.find_by(label: @tag_label).artobjects.reverse
  erb :tag
end



get '/login' do
  erb :login
end

post '/session' do
  user = User.find_by(email: params[:email])

  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    erb :register
  end
end

post '/users' do
  user = User.new
  user.email = params[:email]
  user.password = params[:password]
  user.save
  redirect '/'
end

get '/register' do
  erb :register
end

delete '/session' do
  session[:user_id] = nil
  redirect '/login'
end

helpers do
  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in? #this method returns a boolean
    !!current_user
  end

end
