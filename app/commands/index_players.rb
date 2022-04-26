module App
  module Commands
    class IndexPlayer
      def self.call(position)
        Domain::Player::Services::IndexPlayers.call(position)
      end
    end
  end
end