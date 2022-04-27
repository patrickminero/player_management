module Domain
  module Team
    module Entities
      class Team
        attr_reader :name

        def initialize params
          @id = params[:id]
          @name = params[:name]
        end

        def to_hash
          {id: @id, name: @name}
        end
      end
    end
  end
end