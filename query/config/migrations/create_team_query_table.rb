require 'sequel'
DB = Sequel.connect('sqlite://query.db')

# DB.drop_table :teams
# DB.drop_table :players
DB.create_table :teams do
  primary_key :id
  String :name, :null=>false, :unique=>true
end

DB.create_table :players do
  primary_key :id
  String :name
  Integer :price
  String :position
  foreign_key :team_id, :teams, :null=>false
end
