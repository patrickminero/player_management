require 'spec_helper'

RSpec.describe Team, type: :model do
  describe "validations" do
    it "should test the presence of the name" do
      song = Team.new(name: '')
      expect(song).to_not be_valid
    end
  end

  describe "methods" do
    let(:team) { create(:team) }
    it 'should have a valid name' do
      expect(team.name).not_to be_nil
    end
  end
end