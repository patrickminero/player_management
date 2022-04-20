require 'spec_helper'

RSpec.describe Player, type: :model do
  describe "validations" do
    it 'should validate the presence' do
      expect(build(:player, name: '')).not_to be_valid
      expect(build(:player, price: nil)).not_to be_valid
      expect(build(:player, position: nil)).not_to be_valid
      expect(build(:player, team_id: nil)).not_to be_valid
    end

    it 'should not allow for a different position than the permitted ones' do
      expect(build(:player, position: 'something')).not_to be_valid
    end

  end
end