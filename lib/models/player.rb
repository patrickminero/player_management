class Player
  include Mongoid::Document

  field :name, type: String
  field :position, type: String
  field :price, type: Integer

  belongs_to :team

  validates :position, inclusion: { in: [ "goalkeeper", "defender", "midfield", "forward" ] }
end