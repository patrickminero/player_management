Sequel::Model.plugin :validation_helpers
class Player < Sequel::Model(:players)
  def validate
    super
    validates_presence [:name, :price, :team_id], message: 'Please fill all required fields', on: :create
    validates_includes ['goalkeeper', 'defender', 'midfielder', 'forwarder'], :position, message: 'Enter a valid position', on: :create
  end
end
