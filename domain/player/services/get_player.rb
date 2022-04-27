module Domain
  module Player
    module Services
      class GetPlayer
        def self.call(id)
          player = Repositories::PlayerRepository.find(id)
          Entities::Player.new(player)
        end
      end
    end
  end
end
