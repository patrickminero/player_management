Sequel::Model.plugin :validation_helpers
class Player < Sequel::Model(:players)
  set_primary_key :id

  def validate
    super
    validates_presence [:name, :price, :team_id, :position], message: 'Please fill all required fields', on: :create
    validates_includes ['goalkeeper', 'defender', 'midfielder', 'forwarder'], :position, message: 'Enter a valid position', on: :create
  end
end
