module Domain
  module Team
    module Services
      class CreateTeam
        def self.call(params)
          team = Entities::Team.new(params)
          Repositories::TeamRepository.create(team.to_hash)
        end
      end
    end
  end
end