class PlayerUpdater
  def initialize player
    @player = player
  end

  def update params
    begin
      @player.update(ParamSanitizer.new(Player).sanitize(params))
      202
    rescue Sequel::ValidationFailed
      @player.errors.to_json
    end
  end
end