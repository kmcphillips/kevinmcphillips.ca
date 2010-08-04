class Project
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, Text
  property :url, String
  property :created_at, DateTime
  property :updated_at, DateTime

  validates_presence_of :name, :description, :url
end
