module App
  module Commands
    module Teams
      class DeleteTeam
        def self.call(id)
          Domain::Team::Services::DeleteTeam.call(id)
        end
      end
    end
  end
end
