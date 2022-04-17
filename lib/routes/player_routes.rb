post '/teams/:team_id/players' do |team_id|
  player = JSON.parse params[:player]
  team = Team.find(team_id)
  comment = team.players.create!(player)
  team.attributes.merge(players: team.players).to_json
end