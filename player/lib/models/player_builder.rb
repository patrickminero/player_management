class PlayerBuilder
  def initialize params
    @params = params
  end

  def build
    player = Player.new(ParamSanitizer.new(Player).sanitize(@params))
    player.save ? 201 : player.errors.to_json
  end
end