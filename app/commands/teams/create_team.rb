module App
  module Commands
    module Teams
      class CreateTeam
        def self.call(params)
          validate_params = NewTeamContract.new.call(params)
          Domain::Team::Services::CreateTeam.call(validate_params)
        end
      end
    end
  end
end
