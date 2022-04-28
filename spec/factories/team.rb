require 'faker'

FactoryBot.define do
  factory :team, class: 'domain/team/models/team' do
    name { Faker::Sports::Football.team }
  end
end