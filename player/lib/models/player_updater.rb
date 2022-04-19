class PlayerUpdater
  def initialize player
    @player = player
  end

  def update params
    @player.update(ParamSanitizer.new(Player).sanitize(params)) ? 202 : @player.errors.to_json
  end
end