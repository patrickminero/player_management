require 'spec_helper'

RSpec.describe PlayerBuilder, type: :model do
  describe 'PlayerBuilder' do
    context 'with valid params' do
      let(:params) { {player: {name: 'John Smith', position: 'midfielder', price: 30000}.to_json, team_id: '23asd132'} }
      let(:player) { PlayerBuilder.new(params).build }
      it 'should return a created status' do
        expect(player).to eq 201
      end
    end

    context 'with invalid params' do
      let(:params) { {player: {name: 'John Smith', position: 'something', price: 30000}.to_json, team_id: '23asd132'} }
      let(:player) { PlayerBuilder.new(params).build }
      it 'should return a hash with the error message' do
        expect(player).to eq({:position=>["Enter a valid position"]}.to_json)
      end
    end
  end
end