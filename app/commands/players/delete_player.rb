module App
  module Commands
    module Players
      class DeletePlayer
        def self.call(id)
          Domain::Player::Services::DeletePlayer.call(id)
        end
      end
    end
  end
end
