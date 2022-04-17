get '/teams/:team_id/players' do |team_id|
  Player.where(team_id: team_id).to_json
end

get '/players/:id' do |id|
  Player.find(id).to_json
end

post '/teams/:team_id/players' do |team_id|
  Player.create!(JSON.parse params[:player], team_id: team_id)
end

patch '/players/:id' do |id|
  player = Player.find(id)
  player.update(JSON.parse(params[:player]))
  player
end

delete '/players/:id' do |id|
  player = Player.find(id)
  player.destroy
  {status: 204}.to_json
end