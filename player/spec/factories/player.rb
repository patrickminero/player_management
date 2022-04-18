require 'faker'

FactoryBot.define do
  factory :player do
    name { Faker::Sports::Football.player }
    position { [ "goalkeeper", "defender", "midfield", "forward" ].sample }
    price { Faker::Number.number(digits: 7) }
    team_id { Faker::Alphanumeric.alphanumeric(number: 10) }
  end
end