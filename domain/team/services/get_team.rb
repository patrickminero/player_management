module Domain
  module Team
    module Services
      class GetTeam
        def self.call(id)
          team = Repositories::TeamRepository.find(id)
          team ? Entities::Team.new(team) : nil
        end
      end
    end
  end
end
