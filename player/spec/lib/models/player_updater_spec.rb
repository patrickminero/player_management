require 'spec_helper'

RSpec.describe PlayerUpdater, type: :model do
  describe 'PlayerUpdater' do
    context 'with valid params' do
      let(:params) { {player: {name: 'John Smith', position: 'goalkeeper', price: 30000}.to_json, team_id: '23asd132'} }
      let(:player) { create(:player) }

      let(:updated_player) { PlayerUpdater.new(player).update(params) }

      it 'should return a valid player in json format' do
        expect(updated_player).to eq 202
      end
    end

    context 'with invalid params' do
      let(:params) { {player: {name: 'John Smith', position: 'something', price: 30000}.to_json, team_id: '23asd132'} }
      let(:player) { create(:player) }

      let(:updated_player) { PlayerUpdater.new(player).update(params) }

      it 'should return a hash with the error message' do
        expect(updated_player).to eq ({position: ['Enter a valid position']}.to_json)
      end
    end
  end
end