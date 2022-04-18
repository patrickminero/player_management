require 'spec_helper'

RSpec.describe PlayerBuilder, type: :model do
  describe 'PlayerBuilder' do
    context 'with valid params' do
      let(:params) { {player: {name: 'John Smith', position: 'midfield', price: 30000}.to_json, team_id: '23asd132'} }
      let(:player) { PlayerBuilder.new(params).build }
      it 'should return a valid player in json format' do
        expect(player.class).to eq String
        expect(JSON.parse(player).keys).to include('_id')
      end
    end

    context 'with invalid params' do
      let(:params) { {player: {name: 'John Smith', position: 'something', price: 30000}.to_json, team_id: '23asd132'} }
      let(:player) { PlayerBuilder.new(params).build }
      it 'should return a hash with the error message' do
        expect(player).to eq ({position: ['is not included in the list']}.to_json)
      end
    end
  end
end