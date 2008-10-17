class Page
  include DataMapper::Resource
  
  ### Properties
  
  property :id, Serial
  property :path, String
  property :hash, String
  property :created_at, DateTime
  property :updated_at, DateTime
  
end
