require 'pry'
require 'HTTParty'
require_relative 'db_config'
require_relative 'models/artobject'
require_relative 'models/tag'
require_relative 'models/user'


art_query = "https://www.rijksmuseum.nl/api/en/collection?key=YB4GHC25&format=json&imgonly=true&q=amersfoort"
@artobjects = HTTParty.get(art_query)

result_query = "https://www.rijksmuseum.nl/api/nl/collection/SK-C-5?key=YB4GHC25&format=json"
@artobject = HTTParty.get(result_query)




binding.pry

puts 'app console'
