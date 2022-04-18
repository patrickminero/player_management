require 'faker'
require 'factory_bot'
factory :team do
  name Faker::Sports::Football.team
end