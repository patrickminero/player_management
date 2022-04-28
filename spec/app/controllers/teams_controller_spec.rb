require 'spec_helper'

def app
  Sinatra::Application
end

RSpec.describe TeamsController, type: :request do
  describe 'POST /teams' do
    let(:response) { post '/teams?name=ValenciaCF' }
    it 'creates a new team' do
      expect(response.status).to eq 201
    end
  end

  describe 'GET /teams/:id' do
    context 'with invalid id' do
      let(:response) { get '/teams/asdasdasd' }
      it 'returns not found error message' do
        expect(response.status).to eq 404
      end
    end

    context 'with the right id' do
      let(:team) { create(:team) }
      let(:response) { get "/teams/#{team.id}" }
      it 'should return the correct object' do
        expect(response.status).to eq 200
      end
    end
  end

  describe 'GET /teams' do
    let(:response) { get '/teams' }
    it 'returns all teams with a json format' do
      post '/teams?name=BarcelonaCF'
      expect(JSON.parse(response.body).map{|team| team['name']}).to include('BarcelonaCF')
    end
  end

  describe 'PATCH /teams/:id' do
    context 'with invalid id' do
      let(:response) { patch '/teams/asdasdasd?name=something' }
      it 'returns not found error message' do
        expect(response.status).to eq 404
      end
    end

    context 'with the right id' do
      let(:team) { create(:team) }
      let(:response) { patch "/teams/#{team.id}" }
      it 'should return the correct object' do
        expect(response.status).to eq 202
      end
    end
  end

  describe 'DELETE /teams/:id' do
    context 'with invalid id' do
      let(:response) { delete '/teams/asdasdasd' }
      it 'returns not found error message' do
        expect(response.status).to eq 404
      end
    end

    context 'with the right id' do
      let(:team) { create(:team) }
      let(:response) { delete "/teams/#{team.id}" }
      it 'should return the correct object' do
        expect(response.status).to eq 204
      end
    end
  end
end
