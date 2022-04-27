module App
  module Commands
    module Players
      class CreatePlayer
        def self.call(params)
          validate_params = NewPlayerContract.new.call(params)
          Domain::Player::Services::CreatePlayer.call(validate_params)
        end
      end
    end
  end
end
