require 'sinatra'
require 'mongoid'

Mongoid.load!(File.join(File.dirname(__FILE__), 'config', 'mongoid.yml'))

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

post '/teams/:team_id/players' do |team_id|
  player = JSON.parse params[:player]
  team = Team.find(team_id)
  comment = team.players.create!(player)
  team.attributes.merge(players: team.players).to_json
end
