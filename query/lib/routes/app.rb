before ['/teams/:id', '/teams/:team_id/*'] do
  @team = Team[params[:id]] || Team[params[:team_id]]
  halt 404, { message: 'Team not found' }.to_json unless @team
end

get '/teams' do
  Team.all.map{|team| team.to_hash.merge({players: Player.where(team_id: team.id).map{|player| player.to_hash}})}.to_json
end

get '/teams/:id' do
  @team.to_hash.merge(players: get_players_by_team).to_json
end

get '/teams/:team_id/players' do |team_id|
  params[:position] ?
    Player.where(team_id: @team.id, position: params[:position]).map{|player| player.to_hash}.to_json : 
    get_players_by_team.to_json
end

get '/players' do
  params[:position] ?
    Player.by_position(params[:position]).map{|player| player.to_hash}.to_json :
    Player.all.map{|player| player.to_hash}.to_json
end

get '/players/:id' do |id|
  Player[params[:id]].to_hash.to_json
end

def get_players_by_team
  Player.where(team_id: @team.id).map{|player| player.to_hash}
end
