require_relative './worker.rb'
class CreatePlayerWorker < Worker
  connection = Bunny.new
  connection.start
  channel = connection.create_channel
  queue = channel.queue("player")

  begin
    queue.subscribe(manual_ack: true, block: true) do |_delivery_info, _properties, body|
      player = Player.create(JSON.parse(body))
      puts "#{player.name} created"
      channel.ack(delivery_info.delivery_tag)
    end
  rescue Interrupt => _
    connection.close
    exit(0)
  end

end