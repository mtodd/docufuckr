migration 3, :create_comments  do
  up do
    create_table :comments do
      column :id, Serial
      column :page_id, Integer
      column :user_id, Integer
      column :body, Text
      column :created_at, DateTime
      column :updated_at, DateTime
    end
  end
  
  down do
    drop_table :comments
  end
end
