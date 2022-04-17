get '/teams/:team_id/players' do |team_id|
  Team.find(team_id).players.to_json
end

get '/players/:id' do |id|
  Player.find(id).to_json
end

post '/teams/:team_id/players' do |team_id|
  player = JSON.parse params[:player]
  team = Team.find(team_id)
  comment = team.players.create!(player)
  team.attributes.merge(players: team.players).to_json
end