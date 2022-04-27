module App
  module Commands
    module Teams
      class IndexTeams
        def self.call
          Domain::Team::Services::IndexTeams.call
        end
      end
    end
  end
end
