module Domain
  module Team
    module Models
      class Team < Sequel::Model(:teams)
        def self.find(id)
          Team[id.to_i]
        end
      end
    end
  end
end
