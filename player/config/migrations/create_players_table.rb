require 'sequel'
DB = Sequel.connect('sqlite://players.db')

DB.create_table :players do
  primary_key :id
  String :name
  Integer :position
  Integer :price
  Integer :team_id
end
