module Domain
  module Models
    class Player < Sequel::Model(:players)
      def self.find(id)
        Player[id.to_i]
      end
    end
  end
end
