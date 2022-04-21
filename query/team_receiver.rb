require 'bunny'
require 'sequel'
require 'sinatra'
DB = Sequel.connect('sqlite://query.db')
require './lib/models/team.rb'
class TeamReceiver
  connection = Bunny.new
  connection.start

  channel = connection.create_channel
  queue = channel.queue("teams")
  begin
    queue.subscribe(block: true) do |_delivery_info, _properties, body|
      team = Team.create(JSON.parse(body))
      puts "#{team.name} created"
    end
  rescue Interrupt => _
    connection.close
    exit(0)
  end  
end