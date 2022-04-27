module Domain
  module Player
    module Services
      class CreatePlayer
        def self.call(params)
          player = Entities::Player.new(params)
          Repositories::PlayerRepository.create(player.to_hash)
        end
      end
    end
  end
end
