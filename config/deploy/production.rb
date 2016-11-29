set :branch, "master"
set :deploy_to, "/var/apps/kevinmcphillips.ca"

role :web, "app1.kev.cool"
role :app, "app1.kev.cool"
role :db, "app1.kev.cool"

server "app1.kev.cool", user: "deploy", roles: %w{app db web}

after "deploy:publishing", "deploy:restart"
after "deploy:publishing", "deploy:symlink_shared_files"

namespace :deploy do
  task :restart do
    invoke "unicorn:legacy_restart"
  end

  task :symlink_shared_files do
    on roles(:app) do
      execute "ln -s #{ shared_path }/keybase.txt #{ release_path }/public/keybase.txt"
    end
  end
end
