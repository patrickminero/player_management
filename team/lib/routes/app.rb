before '/teams/:id' do
  @team = Team[params[:id]] || {}
  halt 404, { message: 'Team not found' }.to_json unless @team.exists?
end

get '/teams' do
  Team.all.map{|t| t.values}.to_json
end

get '/teams/:id' do |id|
  @team.values.to_json
end

post '/teams' do
  team = Team.new(name: params[:name])
  halt 400, { message: team.errors }.to_json unless team.valid?
  team.save
  status 201
end

patch '/teams/:id' do |id|
  halt 400, { message: "Name can't be blank" }.to_json if params[:name].empty?
  @team.update(name: params[:name])
  status 202
end

delete '/teams/:id' do |id|
  @team.destroy
  { status: 204 }.to_json
end
