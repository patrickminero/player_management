module Domain
  module Player
    module Services
      class DeletePlayer
        def self.call(id)
          Repositories::PlayerRepository.destroy(id)
        end
      end
    end
  end
end
