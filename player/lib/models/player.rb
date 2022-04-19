class Player < Sequel::Model(:players)
  def validate
    super
    validates_presence_of [:name, :price, :team_id], message 'Please fill all required fields'
    validates_inclusion_of :position, in ['goaldkeeper', 'defender', 'midfielder', 'forwarder'], message: 'Enter a valid position'
  end
end
