class Team < Sequel::Model(:teams)
  def validate
    super
    errors.add(:name, 'cannot be empty') if !name || name.empty?
  end

  # def after_create
  #   connection = Bunny.new
  #   connection.start

  #   channel = connection.create_channel
  #   queue = channel.queue("create.teams")
  #   channel.default_exchange.publish(self.to_hash.to_json, :routing_key => queue.name)
  #   puts "sent #{self.name} to query service"
  #   connection.close
  #   super
  # end

  # def after_update
  #   connection = Bunny.new
  #   connection.start

  #   channel = connection.create_channel
  #   queue = channel.queue("update.teams")
  #   channel.default_exchange.publish(self.to_hash.to_json, :routing_key => queue.name)
  #   puts "sent #{self.name} to query service"
  #   connection.close
  #   super
  # end

  # def after_destroy
  #   connection = Bunny.new
  #   connection.start

  #   channel = connection.create_channel
  #   queue = channel.queue("destroy.teams")
  #   channel.default_exchange.publish(self.id.to_json, :routing_key => queue.name)
  #   puts "sent #{self.name} to query service for destroy"
  #   connection.close
  #   super
  # end
end