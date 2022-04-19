require 'sinatra'
require 'sequel'

DB = Sequel.connect('sqlite://players.db')

require 'require_all'
require_all 'lib'
