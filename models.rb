require 'bundler/setup'
# require 'lib/carrierwave/mount'
# require './image_uploader.rb'


Bundler.require

class Post < ActiveRecord::Base
        validates :title,
       presence: true
end


if development?
ActiveRecord::Base.establish_connection("sqlite3:db/development.db")
end