module App
  module Commands
    module Teams
      class GetTeam
        def self.call(id)
          Domain::Team::Services::GetTeam.call(id)
        end
      end
    end
  end
end
