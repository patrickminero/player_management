get '/teams/:team_id/players' do |team_id|
  PlayerQuery.where(team_id: team_id).to_json
end

get '/teams/:team_id/players/position/:position' do |team_id, position|
  PlayerQuery.where(team_id: team_id, position: position).to_json
end

get 'players/position/:position' do |position|
  PlayerQuery.where(position: position).to_json
end

post '/players' do
  player_query = PlayerQuery.create(params[:player])
end

patch '/players/:id' do
  player_query = PlayerQuery.update(params[:player])
end

delete '/players' do
  player_query = PlayerQuery.destroy(params[:player])
end
