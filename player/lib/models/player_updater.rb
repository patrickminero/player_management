class PlayerUpdater
  def initialize player
    @player = player
  end

  def update params
    @player.update(ParamSanitizer.new(Player).sanitize(JSON.parse(params))) ? @player.to_json : @player.errors.to_json
  end
end