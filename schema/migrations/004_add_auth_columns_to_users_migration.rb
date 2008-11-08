migration 4, :add_auth_columns_to_users  do
  
  up do
    modify_table :users do
      add_column :crypted_password, String
      add_column :salt, String
    end
  end
  
  down do
    modify_table :users do
      drop_column :crypted_password
      drop_column :salt
    end
  end
  
end
