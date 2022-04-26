Sequel.migration do
  up do
    DB.create_table :teams do
      primary_key :id
      String :name
    end
  end

  down do
    drop_table(:teams)
  end
end
