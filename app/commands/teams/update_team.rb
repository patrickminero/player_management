module App
  module Commands
    module Teams
      class UpdateTeam
        def self.call(params)
          validate_params = NewTeamContract.new.call(params)
          return validate_params unless validate_params.errors.empty?
          Domain::Team::Services::UpdateTeam.call(params[:id], validate_params)
        end
      end
    end
  end
end
