class Post < ActiveRecord::Base
  attr_accessible :body, :permalink, :title

  acts_as_permalink

  scope :sorted, order("created_at DESC")
end
