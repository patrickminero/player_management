module App
  module Commands
    module Players
      class UpdatePlayer
        def self.call(params)
          validate_params = EditPlayerContract.new.call(params)
          return validate_params unless validate_params.errors.empty?
          Domain::Player::Services::UpdatePlayer.call(params[:id], validate_params.to_h)
        end
      end
    end
  end
end
