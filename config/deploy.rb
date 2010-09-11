## Deployment config for production
set :application, "Kevin McPhillips"
set :deploy_to, "/home/kevin/kevinmcphillips.ca"
set :user, "kevin"
set :use_sudo, false
set :keep_releases, 10

## Configure source control
set :scm, "git"
set :repository,  "git://github.com/kimos/kevinmcphillips.ca.git"
set :branch, "master"
set :deploy_via, :checkout
set :git_shallow_clone, 1

## Fix for requiring terminal on prod server
default_run_options[:pty] = true

## Role for production
role :web, "kevinmcphillips.ca"
role :app, "kevinmcphillips.ca"

## Tasks for deploying to Apache Passenger
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

## Symlink the production database and seed
after "deploy", "symlink_shared_files"

task :symlink_shared_files do
  db_file = "kevinmcphillips.ca.db"
  run "touch #{shared_path}/#{db_file}"
  
  [db_file].each do |file|
    run "ln -s #{shared_path}/#{file} #{release_path}/db/#{file}"
  end
end

## restart the app
task :restart do
  run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
end

