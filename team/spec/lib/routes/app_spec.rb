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
      it 'should return a json string with the correct data' do
        expect(response.body).to eq team.to_json
        expect(response.status).to eq 200
      end
    end
  end

  describe 'GET /teams' do
    let(:teams) { create_list(:team, 5) }
    let(:response) { get '/teams' }
    it 'returns all teams with a json format' do
      expect(response.body).to eq(teams.to_json)
    end
  end
end
