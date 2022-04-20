require 'spec_helper'

RSpec.describe Team, type: :model do
  describe "validations" do
    it{ is_expected.to validate_presence :name }
  end

  describe 'associations' do
    it{ is_expected.to have_one_to_many :players }
  end

  describe 'methods' do
    let!(:team) { create :team }
    let!(:defenders) { create_list :player, 5, position: 'defender', team_id: team.id }
    let!(:goalie) { create :player, position: 'goalkeeper', team_id: team.id }
    it 'should list all players' do
      expect(team.players).to eq defenders << goalie
    end

    it 'should filter team players #by_position' do
      expect(team.by_position 'defender').to eq defenders
    end
  end
end