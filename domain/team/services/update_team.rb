module Domain
  module Team
    module Services
      class UpdateTeam
        def self.call(id, params)
          team = Entities::Team.new(params)
          Repositories::TeamRepository.update(id, team.to_hash)
        end
      end
    end
  end
end
