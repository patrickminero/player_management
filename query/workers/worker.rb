require 'bunny'
require 'sequel'
require 'active_support/all'
require 'sinatra'

DB = Sequel.connect('sqlite://query.db')

require './lib/models/team.rb'
require './lib/models/player.rb'
class Worker;end
