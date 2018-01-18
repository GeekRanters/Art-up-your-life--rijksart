# settings for activerecord
require 'active_record'
require 'pg'

options ={
  adapter: 'postgresql',
  database: 'rijksart'
}

ActiveRecord::Base.establish_connection( ENV['DATABASE_URL'] || options)
