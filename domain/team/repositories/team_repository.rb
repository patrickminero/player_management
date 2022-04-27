module Domain
  module Team
    module Repositories
      class TeamRepository
        def self.all
          Domain::Team::Models::Team.all
        end

        def self.create(params)
          Domain::Team::Models::Team.create(params)
        end

        def self.find(id)
          Domain::Team::Models::Team.find(id)
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
