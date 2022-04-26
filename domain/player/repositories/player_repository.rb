module Domain
  module Player
    module Repositories
      class PlayerRepository
        def self.create(params)
          Domain::Models::Player.create(params)
        end

        def self.find(id)
          Domain::Models::Player.find(id)
        end

        def self.update(id, params)
          player = find(id.to_i).update(params)
        end

        def find_by_team(team_id)
          Player.where(team_id: team_id)
        end
      end
    end
  end
end