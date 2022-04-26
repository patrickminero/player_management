class PlayersController < Sinatra::Base
  before '/players/:id' do
    @player = Player[params[:id].to_i]
    halt 404, { message: 'Player not found' }.to_json if @player.nil?
  end

  get '/teams/:team_id/players' do |team_id|
    Player.where(team_id: team_id).map{|player| player.values}.to_json
  end

  get '/players/:id' do
    @player.values.to_json
  end

  post '/teams/:team_id/players' do
    PlayerBuilder.new(params).build
  end

  patch '/players/:id' do
    PlayerUpdater.new(@player).update(params)
  end

  delete '/players/:id' do |id|
    @player.destroy
    {status: 204}.to_json
  end
end
