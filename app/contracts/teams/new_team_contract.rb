class NewTeamContract < Dry::Validation::Contract
  params do
    required(:name).filled(:string)
  end
end
