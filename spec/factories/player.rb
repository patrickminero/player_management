require 'faker'

FactoryBot.define do
  factory :player, class: 'domain/player/models/player' do
    name { Faker::Sports::Football.player }
    position { [ "goalkeeper", "defender", "midfielder", "forwarder" ].sample }
    price { Faker::Number.number(digits: 7) }
    team_id { Faker::Alphanumeric.alphanumeric(number: 10) }
  end
end