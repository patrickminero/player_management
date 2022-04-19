require 'sinatra'
require 'sequel'

DB = Sequel.connect('sqlite://teams.db')

require 'require_all'
require_all 'lib'


