require 'spec_helper'

RSpec.describe ParamSanitizer, type: :model do
  describe 'Player params' do
    let(:params) { ParamSanitizer.new(Player).sanitize({player: {id: 123, name: 'John Smith', random: 'asdasda'}.to_json, team_id: 'asdasd21343asdasd'}) }
    it 'should not allow to modify id' do
      expect(params.keys).not_to include('id')
    end

    it 'should not allow to unpermitted params' do
      expect(params.keys).not_to include('random')
    end

    it 'should allow to permitted params' do
      expect(params.keys).to include('name')
    end
  end
end
