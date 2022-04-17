class PlayerQuery
  include Mongoid::Document

  field :name, type: String
  field :position, type: String
  field :price, type: Integer
  field :team_id, type: String
end
