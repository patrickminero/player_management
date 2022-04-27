module Domain
  module Player
    module Services
      class UpdatePlayer
        def self.call(id, params)
          Repositories::PlayerRepository.update(id, params)
        end
      end
    end
  end
end
