class Team < Sequel::Model(:teams)
  one_to_many :players
  
  def by_position position
    self.players.select{ |player| player.position == position }
  end

  def validate
    super
    validates_presence :name, message: 'Please fill all required fields'
  end
end
