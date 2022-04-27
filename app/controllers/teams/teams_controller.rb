class  TeamsController < Sinatra::Base
  get '/teams' do
    App::Commands::Teams::IndexTeams.call.to_json
  end

  get '/teams/:id' do |id|
    
  end

  post '/teams' do
    
  end

  patch '/teams/:id' do |id|
    
  end

  delete '/teams/:id' do |id|
    
  end
end
