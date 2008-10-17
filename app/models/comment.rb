class Comment
  include DataMapper::Resource
  
  ### Properties
  
  property :id, Serial
  property :page_id, Integer
  property :user_id, Integer
  property :body, Text
  property :created_at, DateTime
  property :updated_at, DateTime
  
  ### Associations
  
  belongs_to :page
  belongs_to :user
  
end
