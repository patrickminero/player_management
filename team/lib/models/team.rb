class Team < Sequel::Model(:teams)
  def validate
    super
    errors.add(:name, 'cannot be empty') if !name || name.empty?
  end
end