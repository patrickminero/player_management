class ParamSanitizer
  def initialize klass
    @class = klass
    @valid_fields = @class.attribute_names - ['_id']
  end

  def sanitize params
    JSON.parse(params).select { |param| @valid_fields.include? param }
  end
end