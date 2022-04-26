Sequel::Model.plugin :validation_helpers
class Player < Sequel::Model(:players)
  def validate
    super
    validates_presence [:name, :price, :team_id], message: 'Please fill all required fields', on: :create
    validates_includes ['goalkeeper', 'defender', 'midfielder', 'forwarder'], :position, message: 'Enter a valid position', on: :create
  end

  # def after_create
  #   conn = Bunny.new
  #   conn.start

  #   ch = conn.create_channel
  #   q  = ch.queue("player")
  #   x  = ch.default_exchange.publish(self.to_hash.to_json, :routing_key => q.name)
  #   puts "sent #{self.name} to query service"
  #   conn.close
  #   super
  # end
end
