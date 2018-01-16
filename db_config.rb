# settings for activerecord
require 'pg'
require 'active_record'
require_relative'models/artobject'
require_relative'models/tag'
require_relative'models/user'



options ={
  adapter: 'postgresql',
  database: 'rijksart'
}

ActiveRecord::Base.establish_connection(options)
