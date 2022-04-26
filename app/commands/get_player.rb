module App
  module Commands
    class GetPlayer
      def self.call(params)
        Domain::Player::Services::GetPlayer.call(params)
      end
    end
  end
end