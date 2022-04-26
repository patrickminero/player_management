require 'sinatra'
require 'sequel'
require 'bunny'

DB = Sequel.connect('sqlite://player_management.db')

require 'require_all'
require_all 'domain', 'app'

use TeamsController
use PlayersController
