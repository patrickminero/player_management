get '/teams' do
  Team.all.to_json
end

get '/teams/:id' do |id|
  team = Team.find(id)
  team.attributes.merge(
    players: team.players,
  ).to_json
end

post '/teams' do
  team = Team.create!(name: params[:name])
  team.to_json
end

patch '/teams/:id' do |id|
  team = Team.find(id)
  team.update(name: params[:name])
  team.to_json
end

delete '/teams/:id' do |id|
  team = Team.find(id)
  team.destroy
  { status: 204 }.to_json
end
