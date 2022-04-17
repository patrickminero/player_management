before '/players/:id' do
  @player = Player.find(params[:id]) || {}
end

get '/teams/:team_id/players' do |team_id|
  Player.where(team_id: team_id).to_json
end

get '/players/:id' do
  return { status: 404 }.to_json unless @player.present?
  @player.to_json
end

post '/teams/:team_id/players' do
  player = Player.new(ParamSanitizer.new(Player).sanitize(params[:player]))
  player.team_id = params[:team_id]
  if player.save!
    player.to_json
  else
    {status: 404}
  end
end

patch '/players/:id' do |id|
  return { status: 404 }.to_json unless @player.present?
  @player.update(ParamSanitizer.new(Player).sanitize(params[:player]))
  @player.to_json
end

delete '/players/:id' do |id|
  return { status: 404 }.to_json unless @player.present?
  @player.destroy
  {status: 204}.to_json
end