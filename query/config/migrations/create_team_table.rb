require 'sequel'
DB = Sequel.connect('sqlite://query.db')

DB.create_table :teams do
  Integer :id
  String :name, :null=>false
end

DB.create_table :players do
  Integer :id
  String :name
  Integer :price
  String :position
  Integer :team_id
end
