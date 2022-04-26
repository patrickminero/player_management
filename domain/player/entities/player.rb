module Domain
  module Player
    module Entities
      class Player
        attr_reader :name, :price, :position, :team_id

        def initialize params
          @name = params[:name]
          @price = params[:price]
          @position = params[:position]
          @team_id = params[:team_id]
        end

        def to_hash
          {name: @name, price: @price, position: @position, team_id: @team_id.to_i}
        end
      end
    end
  end
end