require 'digest/sha1'

class Page
  include DataMapper::Resource
  
  ### Properties
  
  property :id, Serial
  property :path, String
  property :hash, String
  property :created_at, DateTime
  property :updated_at, DateTime
  
  ### Methods
  
  def full_path
    Merb.root/:public/:docs/"#{self.path}.html"
  end
  
  def content
    File.read(self.full_path)
  end
  
  ### Class Methods
  
  class << self
    
    def by_path(search_path)
      Merb.logger.debug "Searching for: #{search_path}"
      unless page = self.first(:path => search_path)
        Merb.logger.debug "Cache not found: #{search_path}"
        full_path = Merb.root/:public/:docs/"#{search_path}.html"
        if File.exist?(full_path)
          Merb.logger.debug "Found: #{search_path}"
          file = File.open(full_path, 'r')
          page = Page.new(:path => search_path, :hash => Digest::SHA1.hexdigest(file.read))
          page.save
        else
          Merb.logger.debug "Not found: #{search_path}"
          raise NotFound.new("#{search_path} was not found.")
        end
      else
        Merb.logger.debug "Cache found: #{search_path}"
      end
      page
    end
    
  end
  
end
