class PlayerBuilder
  def initialize params
    @params = params
  end

  def build
    player = Player.new(ParamSanitizer.new(Player).sanitize(@params))
    begin
      player.save
      201
    rescue Sequel::ValidationFailed
      player.errors.to_json
    end
  end
end