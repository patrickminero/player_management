class Team < Sequel::Model(:teams)
  def validate
    super
    errors.add(:name, 'cannot be empty') if !name || name.empty?
  end

  def after_create
    conn = Bunny.new
    conn.start

    ch = conn.create_channel
    q  = ch.queue("teams")
    x  = ch.default_exchange.publish(self.to_hash.to_json, :routing_key => q.name)
    puts "sent #{self.name} to query service"
    conn.close
    super
  end
end