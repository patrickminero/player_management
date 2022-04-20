before ['/teams/:id', '/teams/:team_id/*'] do
  @team = Team[params[:id]] || Team[params[:team_id]]
  halt 404, { message: 'Team not found' }.to_json unless @team
end

get '/teams' do
  Team.eager(:players).all.map{|team| team.to_hash.merge({players: team.players.map{|player| player.to_hash}})}.to_json
end

get '/teams/:id' do
  @team.to_hash.merge(players: @team.players.map{|player| player.to_hash}).to_json
end

get '/teams/:team_id/players' do |team_id|
  params[:position] ? @team.by_position(params[:position]).map{|player| player.to_hash}.to_json : @team.players.map{|player| player.to_hash}.to_json
end

get '/players' do
  params[:position] ? Player.by_position(params[:position]).map{|player| player.to_hash}.to_json : Player.all.map{|player| player.to_hash}.to_json
end

get '/players/:id' do |position|
  Player[:id].to_hash.to_json
end
