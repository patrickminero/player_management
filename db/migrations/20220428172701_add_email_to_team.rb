Sequel.migration do
  up do
    add_column :teams, :email, String
    from(:teams).update(email: 'add_an_email@address.com')
  end

  down do
    drop_column :teams, :email
  end
end
