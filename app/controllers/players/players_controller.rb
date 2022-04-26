class PlayersController < Sinatra::Base
  before '/players/:id' do
    @player = App::Commands::GetPlayer.call(params[:id])
    halt 404, { message: 'Player not found' }.to_json if @player.nil?
  end

  get '/teams/:team_id/players' do |team_id|
    Player.where(team_id: team_id).map{|player| player.values}.to_json
  end

  get '/players/:id' do
    @player.to_hash.to_json
  end

  post '/teams/:team_id/players' do
    player = App::Commands::CreatePlayer.call(params)
    player.valid? ? 201 : player.errors.to_json
  end

  patch '/players/:id' do
    player = App::Commands::UpdatePlayer.call(params)
    player.errors.empty? ? 202 : player.errors.to_hash.to_json
  end

  delete '/players/:id' do |id|
    @player.destroy
    {status: 204}.to_json
  end
end
