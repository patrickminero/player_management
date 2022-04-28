module Domain
  module Team
    module Entities
      class Team
        attr_reader :name, :email

        def initialize params
          @id = params[:id] if params[:id]
          @name = params[:name]
          @email = params[:email]
        end

        def to_hash
          !@id ? { name: @name, email: @email} : { id: @id, name: @name, email: @email }
        end
      end
    end
  end
end
