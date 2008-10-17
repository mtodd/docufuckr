migration 1, :create_pages  do
  up do
    create_table :pages do
      column :id, Serial
      column :path, String
      column :hash, String
      column :created_at, DateTime
      column :updated_at, DateTime
    end
  end
  
  down do
    drop_table :pages
  end
end
