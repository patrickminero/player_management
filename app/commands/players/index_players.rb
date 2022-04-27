module App
  module Commands
    module Players
      class IndexPlayer
        def self.call(position)
          Domain::Player::Services::IndexPlayers.call(position)
        end
      end
    end
  end
end
