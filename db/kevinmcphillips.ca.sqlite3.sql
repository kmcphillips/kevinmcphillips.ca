BEGIN;
CREATE TABLE "projects" ("id" Integer PRIMARY KEY AUTO_INCREMENT, "name" String(50), "description" String(65535), "url" String(50), "source_url" String(50), "img" String(50));
INSERT INTO "projects" VALUES(1,'This Site','Recently I''ve been trying to branch out from just working with Ruby on Rails. After all, Rails and ActiveRecord aren''t the only Ruby based web frameworks on the block. This site is written in Padrino and uses DataMapper for ORM.','http://kevinmcphillips.ca','http://github.com/kimos/kevinmcphillips.ca','kevinmcphillips.ca.png');
INSERT INTO "projects" VALUES(2,'Andrew Littleford','This is a full Rails 3 site for Andrew Littleford, a Winnipeg trumpet player.','http://andrewlittleford.com','https://github.com/kimos/andrewlittleford.com','andrewlittleford.com.png');
INSERT INTO "projects" VALUES(3,'Stoneboat Pottery','A website written in Rails for a member of my ceramics co-op. It boasts a full CMS back end, including management of nested groups of products. It also does AJAX uploading of photos for almost every entity on the site. It''s hosted on GitHub with zero-to-running in only a couple minutes.','http://stoneboatpottery.ca','http://github.com/kimos/stoneboat_pottery','stoneboatpottery.ca.png');
INSERT INTO "projects" VALUES(4,'ebritton.com','One of my legacy sites written in PHP. It again provides a full CMS. It''s legacy code but I include it for completeness and because everyone has old code they maintain and have to avoid the constant urge re-write.','http://ebritton.com','','ebritton.com.png');
INSERT INTO "projects" VALUES(5,'GraceHrabi.com','The professional site for jazz vocalist Grace Hrabi. It is written in Rails 3 with a full CMS. Lots of goodies in the source.','http://gracehrabi.com','https://github.com/kimos/gracehrabi.com','gracehrabi.com.png');
INSERT INTO "projects" VALUES(6,'Clifton Studios','I put together this project for my artist cooperative. From the front it looks like a pretty simple site, but back end has logins for all studio members. It manages user info, personal image galleries, contact lists, mailing lists, and all sorts of good stuff. ','http://cliftonstudios.ca','https://github.com/kimos/cliftonstudios.ca','cliftonstudios.ca.png');
CREATE TABLE "posts" ("id" Integer PRIMARY KEY AUTO_INCREMENT, "title" String(50), "body" String(65535), "permalink" String(50), "created_at" DateTime);
INSERT INTO "posts" VALUES(1,'Deploy: Success','I''ve finally made the time to put together a professional website for myself and my work. It''s still under heavy development but it works and is definitely worth deploying.
                  
                  This is my foray into the <a href="http://padrinorb.com">Padrino framework</a>. Initially I was using just <a href="http://http://www.sinatrarb.com"/>Sinatra</a> but as a coworker said to me "any sufficiently complicated Sinatra app is indistinguishable from rails" and I found myself implementing lots of library-type functions that have clearly been written many times before. Padrino is still light weight and simple, but with a fairly complete api of helpers. The drop in admin area is great too. I''ve written my share of CMS scaffolding and really didn''t need to do it all again. The migration was smooth and simple. Plus it''s still Rack so the <a href="http://www.capify.org/">Capistrano</a> deploy file didn''t really have to change at all and the server config was already right.
                  
                  There are still lots of features I''m working on. RSS is a big one. Some CSS polish. There are still plenty of image placeholders and blocks of content that are missing. ','deploy__success','2010-09-16T13:02:28-04:00');
INSERT INTO "posts" VALUES(2,'Rails 3 with Haml, RSpec, MySQL, and jQuery','Each Rails developer works with their own favourite set of tools and plugins that they are comfortable with. Rails 3 has made it easier to load up and get going quickly with the plugins of your choice, provided you know how to get them setup. This is how I get going with Haml, RSpec, MySQL, and jQuery.
                  
Start by generating your project and skip generation of prototype and test-unit and select MySQL:
                  
<blockquote>$ rails new delicious_pie_factory --skip-prototype --skip-test-unit --database=mysql</blockquote>

Once your app has generated open up your Gemfile and add a couple of gems that are required to generate the good stuff we''re looking for.
                  
<blockquote>gem ''mysql2''
gem ''haml''


group :development, :test do
    gem "rspec", ">= 2.0.0"
    gem "rspec-rails", ">= 2.0.0"
    gem "haml-rails"
    gem "jquery-rails"
end</blockquote>

The ''haml-rails'' gem will override the scaffold generators to produce templates in haml. You''ll have to go in and switch up your application layout manually still, but odds are you''ll have plenty of changes to make to that file anyway.

Do a bundle install before you move forward and let it fetch the gems we just added.

Next, install jQuery as your javascript library. This will fetch the new version of jQuery and set the :defaults tag to include the jQuery js files. Bonus, include --ui to install jQuery UI at the same time.

<blockquote>$ rails g jquery:install
 </blockquote>

Do pretty much the same thing for RSpec

<blockquote>$ rails g jquery:install</blockquote>

That''s the meat of it. You''ll be left to update the config/database.yml file to have the credentials for your MySQL database but the base config file is already there.','rails_3_with_haml__rspec__mysql__and_jque','2010-11-30T17:00:50-05:00');
INSERT INTO "posts" VALUES(3,'GraceHrabi.com updated and deployed','The website for the lovely jazz vocalist Grace Hrabi, located at <a href="http://gracehrabi.com">gracehrabi.com</a>, was one of a dwindling number of PHP projects I still maintain. I''m slowly trying to port them all over to Ruby as I have time.

She got some professional photos done and we worked together on a design that we are quite happy with. So it is with great pleasure that I present to you the improved <a href="http://gracehrabi.com">gracehrabi.com</a>, now with 100% more Rails 3!','gracehrabi_com_updated_and_deployed','2011-01-12T10:58:53-05:00');
INSERT INTO "posts" VALUES(4,'A dot-com kind of guy','Watching and waiting for three years has finally paid off and I have managed to snag <a href="http://kevinmcphillips.com">kevinmcphillips.com</a> from a similarly named fellow.

I don''t have big plans. For now it just redirects here, but the important bit is that it is mine! My next goal is to overshadow a certain travel company.','a_dot_com_kind_of_guy','2011-01-26T11:02:10-05:00');
INSERT INTO "posts" VALUES(5,'Resume now available','I finally got my act together and got my <a href="http://kevinmcphillips.ca/resume">resume</a> section up. 

That is all.','resume_now_available','2011-02-07T22:56:01-05:00');
INSERT INTO "posts" VALUES(6,'Feed me!','I''ve been working hard on andrewlittleford.com and have it in a beta stage. Sorting out all the details and making it shine is really what takes the most time.

But in the mean time I''ve gotten my act together and finally built a working <a href="/feed.rss">RSS feed</a> for my site. So the first post in my RSS feed is how my RSS feed is working. How pleasantly meta.','feed_me','2011-02-18T16:36:07-05:00');
INSERT INTO "posts" VALUES(7,'AndrewLittleford.com is live','This weekend I launched another site for a local Winnipeg musician. Andrew Littleford is a trumpet player and music educator and his shiny new site can be found here:

<a href="http://andrewlittleford.com/">http://andrewlittleford.com/</a>

The source is available for the curious on <a href="https://github.com/kimos/andrewlittleford.com">GitHub</a>. It is written in Rails 3 with a full and customized CMS back end. It features image uploads and resizing and a flash/HTML media player. I also used jQuery draggable for sorting which was a pleasantly easy library to implement.','andrewlittleford_com_is_live','2011-03-15T20:15:50-04:00');
INSERT INTO "posts" VALUES(8,'Memorable Password','I have been working on a gem for random but memorable password generation. It uses dictionary words and a list of proper names and mixes those up with numbers and/or special characters, depending on the options you pass in. It is inherently less secure than a full random password, but the idea is that if you give the user a password they can remember then hopefully they won''t use "password" or their username or stick the password to the side of their monitor.

Usage is pretty simple.

<blockquote>    MemorablePassword.generate
    => "chuck9paste"
</blockquote>

You can specify upper case if you''d like, as well as special characters. You can put a fixed length or a min length, but those will of course reduce the number of possible permutations and combinations.

The best part is that it filters out profanity so I had to commit a text file containing all the most vulgar and insulting words I could come up with.

The whole API and source is available from GitHub. It is on rubygems.org, currently at version 0.0.3 but I am still working on it.

<a href="https://github.com/kimos/memorable_password">https://github.com/kimos/memorable_password</a>','memorable_password','2011-06-04T11:33:51-04:00');
INSERT INTO "posts" VALUES(9,'All Good Things','It is with great consternation that I made the decision to leave Canada Drugs. I am very fortunate to have had the opportunity to work there with a pretty amazing team of great people and some very talented Ruby developers. Leaving was one of the most difficult decisions I have had to make.

But as good things end, other good things begin. I have accepted a position as a consultant at Online Business Systems. I am still a programmer, but it takes my career in a few new directions. Consulting is the obvious one, but I will be working with an ever changing set of technologies, which is simultaneously thrilling and terrifying. So far the company is wonderful and all the people have been friendly and welcoming. Possibly most notable of all is that the office is downtown! As we all know: <span style="font-style: italic; font-weight: bold">walking > driving</span>

I''ll have to make some updates to this site, change my resume and update my titles, but in due time.','all_good_things','2011-11-21T15:56:25-05:00');
INSERT INTO "posts" VALUES(10,'Git is Great','I have been working on an intro to git presentation I will be doing at Online soon. My current work has me committing to SVN and I had forgotten how painful that can be, especially compared to something as elegant as git.

My original intention was to post the slides here, but I think they may actually belong to my company. So I''ll do the next best thing, or probably an even better thing.

This talk by Scott Chacon of Github is exceptional and it is what my talk will be heavily based on.

<a href="http://www.youtube.com/watch?v=ZDR433b0HJY">http://www.youtube.com/watch?v=ZDR433b0HJY</a>','git_is_great','2012-01-19T19:52:22-05:00');
INSERT INTO "posts" VALUES(11,'Ruby, darling, I missed you','Consulting is very different from being a regular employee.

I should have known this was the case, but it still managed to surprise me. In the process I learned a great many things. All of it good, but not all of it easy.

I have accepted a job offer with another company and am leaving consulting. I''m going to Western Life, a relatively small Winnipeg based company that made me a very good offer to come on as a senior programmer/analyst doing Ruby on Rails development. What it came down to is that despite all the good things at my consulting gig, I spent the last several months wishing I was still working with Ruby. It is also a move from a junior consultant to a senior position. It will give me some great experience mentoring junior developers and let me get into some larger application design stuff. All very exciting. Not to mention that my new office is once again half the distance of the old one.

The interviews included the following words: git, Ruby, Rails, Capistrano, RSpec, MySQL, PHP, Linux, jQuery, and agile. My workstation will have a blank hard drive onto which I can load whatever Linux distribution I would like. I think we are going to get along just fine.','ruby__darling__i_missed_you','2012-02-29T16:43:44-05:00');
INSERT INTO "posts" VALUES(12,'Sublime is sublime','I have never found a Ruby editor that I have been extremely happy with. It seems crazy, and maybe I''m just being fickle, but most of the big players have lacked polish or have had some kind of serious problem that I haven''t been able to overlook.

<a href="http://macromates.com/">Textmate</a> is fine, but rudimentary. I spend more of my time working on Linux anyway so that''s not a universal option. I''m competent in vim but I never got into a workflow I liked. I spent quite a bit of time using <a href="http://www.jetbrains.com/ruby/">RubyMine</a> and I do recommend it, with a speed caveat. It has some pretty amazing features, notably ctrl-clicking to go to the declaration of the method/class/etc including opening up the source for your gems. But I couldn''t get past the memory usage. It would easily use the maximum allowable memory inside the JVM and still be struggling. To make it worse, speed and memory drastically degrades with project size. It''s one thing to have problems with your project scaling, but another if your editor doesn''t scale.

Enter <a href="http://www.sublimetext.com/">Sublime</a>.

It''s a cross platform editor that you will fall in love with. Seriously.

A clean and elegant editor, polished so well you can see your reflection in it. Speed like you can''t believe. Rich selection and editing, using shorcuts to functions you hadn''t even though of using before. It does multiple selection as well as column selection for fast multi-editing. Python extendable. Beautiful syntax highlighting and jumping. There''s even a legacy mode that enables a bunch of vi functionality if you''re already comfortable with vim commands. <a href="http://www.sublimetext.com/features">Etcetera etcetera</a>! I seriously cannot stop gushing about this editor.

Sublime is a commercial product, but there is a trial version that seems to be unlimited. There is nothing to stop you from trying it. Even a PPA for Ubuntu/Debian users.

<blockquote>deb http://ppa.launchpad.net/webupd8team/sublime-text-2/ubuntu oneiric main
deb-src http://ppa.launchpad.net/webupd8team/sublime-text-2/ubuntu oneiric main
</blockquote>

It has a whole set of shortcuts to re-learn of course. I created a cheatsheet for myself so that I actually remember to take advantage of lots of the cool stuff. It''s not all the shortcuts, but just the ones I found useful. You are welcome to it (via Google Docs):

<span style="bold"><a href="https://docs.google.com/spreadsheet/ccc?key=0Al0cmb8HgosTdG5aZjYxVVRJaDBydDd5dXp3Z2lvc1E">Sublime Cheatsheet</a></span>','sublime_is_sublime','2012-03-13T23:49:04-04:00');
INSERT INTO "posts" VALUES(13,'Resque Queueable','<a href="http://github.com/defunkt/resque">Resque</a> is a cool thing. It uses Redis to let you background tasks in a very fast and clean way. Read up on it if you don''t already know it.

The standard pattern was to create an async_whatever method to background each specific method call, and include the object id so ActiveRecord can retrieve your instance for you later.

I just wrote the <a href="http://github.com/kimos/resque-queueable">Resque Queueable</a> gem to automate this pattern. You can mark your model as ''resqueable'', then call the method on the instance queue. This will queue the call for you and let Resque do its thing.

Example:

<blockquote>class Something
  &nbsp;&nbsp;resqueable

  &nbsp;&nbsp;def the_method(arg)
    &nbsp;&nbsp;&nbsp;&nbsp;...
  &nbsp;&nbsp;end
end

Something.last.queue.the_method(123)</blockquote>

It''s available on GitHub of course:
<a href="http://github.com/kimos/resque-queueable">http://github.com/kimos/resque-queueable</a>','resque_queueable','2012-04-24T15:27:29-05:00');
INSERT INTO "posts" VALUES(14,'Affairs of State','I found myself developing an application where most of the models needed basic state information. And I''m not talking about complex state machine stuff. I''m talking two or three states, without callbacks, bolstered by some simple boolean checks and named scopes.

There are plenty of options for state machines in Ruby for ActiveRecord models, but most were way too elaborate for my needs. I also had no plans of repeating code.

I tossed together a gem called Affairs of State:

<a href="https://github.com/kimos/affairs_of_state">https://github.com/kimos/affairs_of_state</a>

It''s pretty simple, nothing revolutionary, but it''s clean and lightweight. Used as follows:
<blockquote>add_column :model_name, :status, :default => "active"</blockquote>

Then in your model:
<blockquote>affairs_of_state :active, :inactive</blockquote>

It then gives you validations, named scopes for finders, boolean methods, and bang methods to update. It also provides you with a ::STATUSES constant on the model returning an array of string statues.

Simple but effective. Checkout the API on Github for full details.','affairs_of_state','2012-06-05T08:59:19-05:00');
COMMIT;
