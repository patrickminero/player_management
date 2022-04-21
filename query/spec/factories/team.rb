require 'faker'

FactoryBot.define do
  factory :team do
    id { Faker::Number.number(digits: 7) }
    name { Faker::Sports::Football.team }
  end
end