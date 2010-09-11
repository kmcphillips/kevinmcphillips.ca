class Project
  include DataMapper::Resource
  include DataMapper::Validate

  property :id, Serial
  property :name, String
  property :description, Text
  property :url, String
  property :source_url, String
  property :img, String

  validates_presence_of :name, :description
  validates_format_of   :url, :source_url, :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix, :message => "is not a valid URL"
  
  def image_path
    "/images/#{img}" unless img.blank?
  end
  
  
end

