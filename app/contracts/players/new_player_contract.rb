class NewPlayerContract < Dry::Validation::Contract
  module Types
    include Dry.Types()
  end

  Statuses = Types::String.enum('goalkeeper', 'defender', 'midfielder', 'forwarder')

  params do
    required(:name).filled(:string)
    required(:price).value(:integer)
    required(:position).value(Statuses)
    required(:team_id).value(:integer)
  end
end