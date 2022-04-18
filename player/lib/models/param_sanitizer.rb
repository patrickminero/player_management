class ParamSanitizer
  def initialize klass
    @class = klass
    @valid_fields = @class.attribute_names - ['_id']
  end

  def sanitize params
    params.select { |param| @valid_fields.include? param.to_s }
  end
end