module Domain
  module Player
    module Entities
      class Player
        attr_reader :name, :price, :position, :team_id

        def initialize params
          @id = params[:id] if params[:id]
          @name = params[:name]
          @price = params[:price]
          @position = params[:position]
          @team_id = params[:team_id]
        end

        def to_hash
          @id ? 
            {id: @id, name: @name, price: @price, position: @position, team_id: @team_id.to_i} :
            {name: @name, price: @price, position: @position, team_id: @team_id.to_i}
        end
      end
    end
  end
end
