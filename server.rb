require 'sinatra'
require 'sequel'
require 'bunny'
require 'dry-types'
require 'dry-validation'

DB = Sequel.connect('sqlite://player_management.db')

require 'require_all'
require_all 'domain', 'app'

use TeamsController
use PlayersController
