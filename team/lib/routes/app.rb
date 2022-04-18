class App < Sinatra::Base
  before '/teams/:id' do
    @team = Team.find(params[:id]) || {}
    halt 404, { message: 'Team not found' }.to_json unless @team.present?
  end

  get '/teams' do
    Team.all.to_json
  end

  get '/teams/:id' do |id|
    @team.to_json
  end

  post '/teams' do
    team = Team.new(name: params[:name])
    team.save ? team.to_json : team.errors.to_json
  end

  patch '/teams/:id' do |id|
    @team.update(name: params[:name]) ? @team.to_json : @team.errors.to_json
  end

  delete '/teams/:id' do |id|
    @team.destroy
    { status: 204 }.to_json
  end
end
