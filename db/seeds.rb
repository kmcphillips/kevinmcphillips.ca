email     = shell.ask "Which email do you want use for loggin into admin?"
password  = shell.ask "Tell me the password to use:"
name      = shell.ask "First name:"
surname   = shell.ask "Last name:"

shell.say ""

account = Account.create(:email => email, :name => name, :surname => surname, :password => password, :password_confirmation => password, :role => "admin")

if account.valid?
  shell.say "Account has been successfully created for: #{email}"
else
  shell.say "Sorry but some thing went worng!"
  shell.say ""
  account.errors.full_messages.each { |m| shell.say "   - #{m}" }
end

shell.say ""


## seed projects if the table is empty
if Project.all.size == 0
  shell.say "Projects being seeded"
  Project.create! :name => "This Site", :url => "http://kevinmcphillips.ca", :description => "Despite me being mostly a Rails programmer, this site is entirely written in Sinatra and Datamapper. Ruby is a beautiful language and Rails/ActiveRecord aren't the only frameworks on the block.", :source_url => "http://github.com/kimos/kevinmcphillips.ca", :img => "thumb_kevinmcphillips.ca.png"
  Project.create! :name => "Andrew Littleford", :url => "http://andrewlittleford.com", :description => "This is a new Rails project that is just started up. I'm working with Andrew, a Winnipeg trumpet player, to gather requirements and start hammering out code.", :img => "thumb_andrewlittleford.com.png"
  Project.create! :name => "Stoneboat Pottery", :url => "http://stoneboatpottery.ca", :source_url => "http://github.com/kimos/stoneboat_pottery", :description => "A website written in Rails for a member of my ceramics co-op. It boasts a full CMS back end, including management of nested groups of products. It also does AJAX uploading of photos for almost every entity on the site. It's hosted on GitHub with zero-to-running in only a couple minutes.", :img => "thumb_stoneboatpottery.ca.png"
  Project.create! :name => "GraceHrabi.com", :url => "http://gracehrabi.com", :description => "One of my legacy sites written in PHP. It again provides a full CMS. It's legacy code but I include it because everyone has old code they maintain and have to avoid the urge to re-write.", :img => "thumb_gracehrabi.com.png"
else
  shell.say "Projects table is not empty so seeding was skipped"
end

shell.say "Done"