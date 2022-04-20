Sequel::Model.plugin :validation_helpers
class Player < Sequel::Model(:players)
  many_to_one :team

  def self.by_position position
    all.select{ |player| player.position == position }
  end

  def validate
    super
    validates_presence [:name, :price, :team_id, :position], message: 'Please fill all required fields', on: :create
    validates_includes ['goalkeeper', 'defender', 'midfielder', 'forwarder'], :position, message: 'Enter a valid position', on: :create
  end
end
