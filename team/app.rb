require 'sinatra'
require 'mongoid'
require 'require_all'
require_all 'lib'

Mongoid.load!(File.join(File.dirname(__FILE__), 'config', 'mongoid.yml'))
