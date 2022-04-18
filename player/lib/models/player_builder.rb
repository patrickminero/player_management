class PlayerBuilder
  def initialize params
    @params = params
  end

  def build
    player = Player.new(ParamSanitizer.new(Player).sanitize(@params))
    player.save ? player.to_json : player.errors.to_json
  end
end