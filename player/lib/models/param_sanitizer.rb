class ParamSanitizer
  def initialize klass
    @class = klass
    @valid_fields = @class.attribute_names - ['_id']
  end

  def sanitize params
    JSON.parse(params[:player]).merge({"team_id": params[:team_id]}).select { |param| @valid_fields.include? param.to_s }
  end
end