require 'spec_helper'

RSpec.describe Player, type: :model do
  describe "validations" do
    it{ is_expected.to validate_presence :name }
    it{ is_expected.to validate_presence :price }
    it{ is_expected.to validate_presence :position }
    it{ is_expected.to validate_presence :team_id }

    it 'should not allow for a different position than the permitted ones' do
      expect(build(:player, position: 'something')).not_to be_valid
    end
  end
end