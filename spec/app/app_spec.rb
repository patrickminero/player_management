require 'spec_helper'

def app
  Sinatra::Application
end

RSpec.describe "App", type: :request do
  describe 'GET /teams/:id' do
    context 'with invalid id' do
      let(:response) { get '/teams/asdasdasd' }
      it 'returns not found error message' do
        expect(response.body).to eq({message: 'Team not found'}.to_json)
        expect(response.status).to eq 404
      end
    end

    context 'with the right id' do
      let(:team) { create(:team) }
      let(:response) { get "/teams/#{team.id}" }
      it 'should return the correct object' do
        expect(response.status).to eq 200
        expect(response.body).to eq(team.values.to_json)
      end
    end
  end

  describe 'POST /teams' do
    let(:response) { post '/teams?name=ValenciaCF' }
    it 'creates a new team' do
      expect(response.status).to eq 201
    end
  end

  describe 'GET /teams' do
    
    let(:response) { get '/teams' }
    it 'returns all teams with a json format' do
      post '/teams?name=BarcelonaCF'
      expect(JSON.parse(response.body).map{|team| team['name']}).to include('BarcelonaCF')
    end
  end
end
