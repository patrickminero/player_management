require 'sequel'
DB = Sequel.connect('sqlite://teams.db')

DB.create_table :teams do
  primary_key :id
  String :name
end