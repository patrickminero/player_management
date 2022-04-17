class Team
  include Mongoid::Document

  field :name, type: String

  has_many :players
end