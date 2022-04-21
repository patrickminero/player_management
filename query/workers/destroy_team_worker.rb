require_relative './worker.rb'
class DestroyTeamWorker < Worker
  connection = Bunny.new
  connection.start

  destroy_channel = connection.create_channel
  destroy_queue = destroy_channel.queue("destroy.teams")

  puts 'Listening for destroy queue'

  begin
    destroy_queue.subscribe(block: true) do |_delivery_info, _properties, body|
      team = Team.where(id: body.to_i)
      team.delete
      pp "team with id #{body} deleted"
    end
  rescue Interrupt => _
    connection.close
    exit(0)
  end
end
