class Team < Sequel::Model(:teams)
  one_to_many :players
  
  def by_position position
    self.players.select{ |player| player.position == position }
  end

  def validate
    super
    errors.add(:name, 'cannot be empty') if !name || name.empty?
  end
end
