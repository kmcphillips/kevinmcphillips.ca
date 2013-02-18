require "bundler/capistrano"

set :application, "Kevin McPhillips"
set :repository,  "git://github.com/kmcphillips/kevinmcphillips.ca.git"
set :deploy_to, "/var/www/kevin/data/www/kevinmcphillips.ca"
set :user, "kevin"
set :use_sudo, false
set :scm, "git"
set :keep_releases, 5

default_run_options[:pty] = true

set :bundle_without, [:development, :test, :linux, :darwin]

role :web, "68.169.58.121"
role :app, "68.169.58.121"
role :db,  "68.169.58.121", :primary => true

after "deploy:update", "deploy:cleanup"
