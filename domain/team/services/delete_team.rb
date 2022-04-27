module Domain
  module Team
    module Services
      class DeleteTeam
        def self.call(id)
          Repositories::TeamRepository.destroy(id)
        end
      end
    end
  end
end
