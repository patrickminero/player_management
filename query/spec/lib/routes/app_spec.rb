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
        expect(response.body).to eq(team.to_hash.merge(players: team.players).to_json)
      end
    end
  end
end
