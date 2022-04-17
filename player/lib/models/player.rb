class Player
  include Mongoid::Document

  field :name, type: String
  field :position, type: String
  field :price, type: Integer
  field :team_id, type: String

  validates :position, inclusion: { in: [ "goalkeeper", "defender", "midfield", "forward" ] }
  validates :name, :position, :price, :team_id, presence: true
end