require 'sinatra'
require 'sequel'
require 'bunny'

DB = Sequel.connect('sqlite://teams.db')

require 'require_all'
require_all 'lib'


