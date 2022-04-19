class ParamSanitizer
  def initialize klass
    @class = klass
    @valid_fields = @class.columns - [:id]
  end

  def sanitize params
    if params[:player]
      JSON.parse(params[:player]).merge({"team_id": params[:team_id]}).select { |param| @valid_fields.include? param.to_sym }
    else
      params.select { |param| @valid_fields.include? param.to_sym }
    end
  end
end