require_relative './worker.rb'
class UpdateTeamWorker < Worker
  connection = Bunny.new
  connection.start

  update_channel = connection.create_channel
  update_queue = update_channel.queue("update.teams")

  puts 'Listening for update queue'

  begin
    update_queue.subscribe(block: true) do |_delivery_info, _properties, body|
      params = JSON.parse(body)
      team = Team.where(id: params['id']).first
      team.update(params.except('id')) if team
      pp "#{team.name} updated" if team
    end
  rescue Interrupt => _
    connection.close
    exit(0)
  end
end
