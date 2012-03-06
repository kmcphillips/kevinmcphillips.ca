class Post
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :body, Text
  property :permalink, String
  property :created_at, DateTime

  before :valid?, :set_permalink

  validates_presence_of :title, :body, :permalink
  validates_uniqueness_of :permalink

  def path
    "/blog/#{permalink}"
  end
  
  def full_path
    "http://kevinmcphillips.ca#{path}"
  end

  protected

  ## Most of this is taken right from http://github.com/kimos/acts_as_permalink
  def set_permalink
    if self.permalink.blank? && !self.title.blank?
      self.permalink = self.title.downcase.strip                      # make the string lowercase and scrub white space on either side
      self.permalink = self.permalink.gsub(/[^a-z0-9\w]/, "_")        # make any character that is not nupermic or alphabetic into an underscore
      self.permalink = self.permalink.sub(/_+$/, "").sub(/^_+/, "")   # remove underscores on either end, caused by non-simplified characters
      self.permalink = self.permalink[0..40]                          # trim to length
        
      # Attempt to find the object by the permalink
      if Post.first(:permalink => self.permalink)
        num = 1

        # If we find the object we know there is a collision, so just add a number to the end until there is no collision
        while Post.first(:permalink => self.permalink + num.to_s)
          num += 1
        end

        self.permalink = self.permalink + num.to_s
      end

      self.permalink
    end
  end
end

