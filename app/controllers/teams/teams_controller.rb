class  TeamsController < Sinatra::Base
  get '/teams' do
    App::Commands::Teams::IndexTeams.call.to_json
  end

  get '/teams/:id' do |id|
    team = App::Commands::Teams::GetTeam.call(params[:id])
    team ? team.to_hash.to_json : 404
  end

  post '/teams' do
    team = App::Commands::Teams::CreateTeam.call(params)
    team ? 201 : 403
  end

  patch '/teams/:id' do
    team = App::Commands::Teams::UpdateTeam.call(params)
    team ? 202 : 400
  end

  delete '/teams/:id' do |id|
    
  end
end
