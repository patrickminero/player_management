before '/players/:id' do
  @player = Player.find(params[:id]) || {}
  halt 404, { message: 'Player not found' }.to_json unless @player.present?
end

get '/teams/:team_id/players' do |team_id|
  Player.where(team_id: team_id).to_json
end

get '/players/:id' do
  @player.to_json
end

post '/teams/:team_id/players' do
  PlayerBuilder.new(params).build
end

patch '/players/:id' do |id|
  PlayerUpdater.new(@player).update(params[:player])
end

delete '/players/:id' do |id|
  @player.destroy
  {status: 204}.to_json
end