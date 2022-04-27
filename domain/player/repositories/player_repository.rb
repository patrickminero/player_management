module Domain
  module Player
    module Repositories
      class PlayerRepository
        def self.all(position)
          !position ? Domain::Models::Player.all : Domain::Models::Player.where(position: position)
        end

        def self.create(params)
          Domain::Models::Player.create(params)
        end

        def self.find(id)
          Domain::Models::Player.find(id)
        end

        def self.update(id, params)
          find(id.to_i)&.update(params)
        end

        def self.destroy(id)
          find(id.to_i)&.destroy
        end
      end
    end
  end
end
