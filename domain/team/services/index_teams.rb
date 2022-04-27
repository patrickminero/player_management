module Domain
  module Team
    module Services
      class IndexTeams
        def self.call
          teams = Repositories::TeamRepository.all
          teams.map{ |team| Entities::Team.new(team.values).to_hash }
        end
      end
    end
  end
end
