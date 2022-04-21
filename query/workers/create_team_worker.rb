require_relative './worker.rb'
class CreateTeamWorker < Worker
  connection = Bunny.new
  connection.start

  channel = connection.create_channel
  create_queue = channel.queue("create.teams")


  puts 'Listening for create queue'

  begin
    create_queue.subscribe(block: true) do |_delivery_info, _properties, body|
      team = Team.create(JSON.parse(body))
      puts "#{team.name} created"
    end
  rescue Interrupt => _
    connection.close
    exit(0)
  end
end