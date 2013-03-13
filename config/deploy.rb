require "bundler/capistrano"

set :application, "Kevin McPhillips"
set :repository,  "git://github.com/kmcphillips/kevinmcphillips.ca.git"
set :deploy_to, "/home/kevinmcphillips/kevinmcphillips.ca"
set :user, "kevin"
set :use_sudo, false
set :scm, "git"
set :keep_releases, 5

default_run_options[:pty] = true

set :bundle_without, [:development, :test, :linux, :darwin]

role :web, "198.211.110.159"
role :app, "198.211.110.159"
role :db,  "198.211.110.159", :primary => true

after "deploy:update", "deploy:cleanup"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, roles: :app, except: {no_release: true} do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

