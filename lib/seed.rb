module DataManager
  def self.migrate!
    DataMapper.auto_migrate!
  end

  def self.seed!
    # TODO: possibly pull this in from YAML or something. I guess this isn't too bad though. Mostly this is just cleaner than cramming it all into hashes in the configure or controller action or something.
    repository(:default).adapter.select "DELETE FROM projects"    
    Project.create! :name => "This Site", :url => "http://kevinmcphillips.ca", :description => "Despite me being mostly a Rails programmer, this site is entirely written in Sinatra and Datamapper. Ruby is a beautiful language and Rails/ActiveRecord aren't the only frameworks on the block.", :source_url => "http://github.com/kimos/kevinmcphillips.ca", :img => "thumb_kevinmcphillips.ca.png"
    Project.create! :name => "Andrew Littleford", :url => "http://andrewlittleford.com", :description => "This is a new Rails project that is just started up. I'm working with Andrew, a Winnipeg trumpet player, to gather requirements and start hammering out code.", :img => "thumb_andrewlittleford.com.png"
    Project.create! :name => "Stoneboat Pottery", :url => "http://stoneboatpottery.ca", :source_url => "http://github.com/kimos/stoneboat_pottery", :description => "A website written in Rails for a member of my ceramics co-op. The site provides full CMS including AJAX image uploads.", :img => "thumb_stoneboatpottery.ca.png"
    Project.create! :name => "GraceHrabi.com", :url => "http://gracehrabi.com", :description => "One of my legacy sites written in PHP. It again provides a full CMS.", :img => "thumb_gracehrabi.com.png"
  end
end
