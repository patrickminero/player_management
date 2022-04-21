require 'sinatra'
require 'sequel'
require 'bunny'

DB = Sequel.connect('sqlite://query.db')

require 'require_all'
require_all 'lib'
