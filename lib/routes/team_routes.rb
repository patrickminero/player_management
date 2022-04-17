get '/teams' do
  Team.all.to_json
end

post '/teams' do
  post = Team.create!(name: params[:name])
  post.to_json
end

get '/teams/:team_id' do |team_id|
  team = Team.find(team_id)
  team.attributes.merge(
    players: team.players,
  ).to_json
end