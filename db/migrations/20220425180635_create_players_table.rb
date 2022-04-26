Sequel.migration do
  up do
    create_table :players do
      primary_key :id
      String :name
      String :position
      Integer :price
      Integer :team_id
    end
  end

  down do
    drop_table(:players)
  end
end
