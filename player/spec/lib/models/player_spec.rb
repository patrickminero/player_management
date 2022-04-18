require 'spec_helper'

RSpec.describe Player, type: :model do
  describe "validations" do
    it 'should validate the presence' do
      expect(build(:player, name: '')).to be_invalid
      expect(build(:player, price: nil)).to be_invalid
      expect(build(:player, position: nil)).to be_invalid
      expect(build(:player, team_id: nil)).to be_invalid
    end

    it 'should not allow for a different position than the permitted ones' do
      expect(build(:player, position: 'something')).to be_invalid
    end

  end
end