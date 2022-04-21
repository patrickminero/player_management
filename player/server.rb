require 'sinatra'
require 'sequel'
require 'bunny'

DB = Sequel.connect('sqlite://players.db')

require 'require_all'
require_all 'lib'

Player.plugin :validation_class_methods
