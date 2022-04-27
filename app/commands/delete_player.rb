module App
  module Commands
    class DeletePlayer
      def self.call(id)
        Domain::Player::Services::DeletePlayer.call(id)
      end
    end
  end
end
