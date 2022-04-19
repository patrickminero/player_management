require 'sequel'
DB = Sequel.connect('sqlite://players.db')

DB.create_table :players do
  primary_key :id
  String :name
  String :position
  Integer :price
  Integer :team_id
end
