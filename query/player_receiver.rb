require 'bunny'
require 'sequel'
require 'sinatra'
DB = Sequel.connect('sqlite://query.db')
require './lib/models/player.rb'
class PlayerReceiver
  connection = Bunny.new
  connection.start

  channel = connection.create_channel
  queue = channel.queue("player")
  begin
    queue.subscribe(block: true) do |_delivery_info, _properties, body|
      player = Player.create(JSON.parse(body))
      puts "#{player.name} created"
    end
  rescue Interrupt => _
    connection.close
    exit(0)
  end  
end