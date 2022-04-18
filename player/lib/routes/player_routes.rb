before '/players/:id' do
  @player = Player.find(params[:id]) || {}
end

get '/teams/:team_id/players' do |team_id|
  Player.where(team_id: team_id).to_json
end

get '/players/:id' do
  return { status: 404, error: 'player not found' }.to_json unless @player.present?
  @player.to_json
end

post '/teams/:team_id/players' do
  PlayerBuilder.new(params).build.to_json
end

patch '/players/:id' do |id|
  return { status: 404, error: 'player not found' }.to_json unless @player.present?
  @player.update(ParamSanitizer.new(Player).sanitize(params[:player]))
  @player.to_json
end

delete '/players/:id' do |id|
  return { status: 404, error: 'player not found' }.to_json unless @player.present?
  @player.destroy
  {status: 204}.to_json
end