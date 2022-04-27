module App
  module Commands
    module Players
      class GetPlayer
        def self.call(params)
          Domain::Player::Services::GetPlayer.call(params)
        end
      end
    end
  end
end
