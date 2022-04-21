Sequel::Model.plugin :validation_helpers
class Team < Sequel::Model(:teams)
  set_primary_key :id
  def by_position position
    self.players.select{ |player| player.position == position }
  end

  def validate
    super
    validates_presence :name, message: 'Please fill all required fields'
  end
end
