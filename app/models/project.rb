class Project < ActiveRecord::Base
  attr_accessible :description, :img, :name, :source_url, :url

  scope :sorted, order("created_at DESC")  

end
