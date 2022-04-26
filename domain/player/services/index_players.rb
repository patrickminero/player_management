module Domain
  module Player
    module Services
      class IndexPlayers
        def self.call(position)
          players = Repositories::PlayerRepository.all(position)
          players.map{ |player| Entities::Player.new(player.values).to_hash }
        end
      end
    end
  end
end
