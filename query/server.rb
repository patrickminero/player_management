require 'sinatra'
require 'sequel'

DB = Sequel.connect('sqlite://query.db')

require 'require_all'
require_all 'lib'
