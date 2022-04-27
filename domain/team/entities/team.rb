module Domain
  module Team
    module Entities
      class Team
        attr_reader :name

        def initialize params
          @id = params[:id] if params[:id]
          @name = params[:name]
        end

        def to_hash
          !@id ? { name: @name} : { id: @id, name: @name }
        end
      end
    end
  end
end
