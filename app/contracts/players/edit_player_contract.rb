class EditPlayerContract < Dry::Validation::Contract
  params do
    optional(:name).filled(:string)
    optional(:price).value(:integer)
    optional(:position).value(:string)
    optional(:team_id).value(:integer)
  end

  rule(:position) do
    key? ? 
      (key.failure('must be a valid position') unless ['goalkeeper', 'defender', 'midfielder', 'forwarder'].include?(value)) :
      true
  end
end
