class PlayersController < Sinatra::Base
  get '/players' do
    App::Commands::IndexPlayer.call(params[:position]).to_json
  end

  get '/players/:id' do
    player = App::Commands::GetPlayer.call(params[:id]).to_hash.to_json
    player.errors.empty? ? 200 : player.errors.to_hash.to_json
  end

  post '/teams/:team_id/players' do
    player = App::Commands::CreatePlayer.call(params)
    player.errors.empty? ? 201 : player.errors.to_hash.to_json
  end

  patch '/players/:id' do
    player = App::Commands::UpdatePlayer.call(params)
    player.errors.empty? ? 202 : player.errors.to_hash.to_json
  end

  delete '/players/:id' do |id|
    player = App::Commands::DeletePlayer.call(params[:id])
    player ? 204 : 404
  end
end
