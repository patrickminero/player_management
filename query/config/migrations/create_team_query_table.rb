require 'sequel'
DB = Sequel.connect('sqlite://query.db')

DB.create_table :teams do
  primary_key :id
  String :name, :null=>false
end

DB.create_table :players do
  primary_key :id
  String :name
  Integer :price
  String :position
  foreign_key :team_id, :teams, :null=>false
end
