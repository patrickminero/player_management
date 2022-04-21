require 'faker'

FactoryBot.define do
  factory :player do
    id { Faker::Number.number(digits: 7) }
    name { Faker::Sports::Football.player }
    position { [ "goalkeeper", "defender", "midfielder", "forwarder" ].sample }
    price { Faker::Number.number(digits: 7) }
    team_id { Faker::Alphanumeric.alphanumeric(number: 10) }
  end
end