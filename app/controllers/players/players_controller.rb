class PlayersController < Sinatra::Base
  get '/players' do
    App::Commands::Players::IndexPlayer.call(params[:position]).to_json
  end

  get '/players/:id' do
    player = App::Commands::Players::GetPlayer.call(params[:id])
    player ? player.to_hash.to_json : 404
  end

  post '/teams/:team_id/players' do
    player = App::Commands::Players::CreatePlayer.call(params)
    player.errors.empty? ? 201 : player.errors.to_hash.to_json
  end

  patch '/players/:id' do
    player = App::Commands::Players::UpdatePlayer.call(params)
    player.errors.empty? ? 202 : player.errors.to_hash.to_json
  end

  delete '/players/:id' do |id|
    player = App::Commands::Players::DeletePlayer.call(params[:id])
    player ? 204 : 404
  end
end
