set :branch, "master"
set :deploy_to, "/var/apps/kevinmcphillips.ca"

role :web, "app1.kev.cool"
role :app, "app1.kev.cool"
role :db, "app1.kev.cool"

server "app1.kev.cool", user: "deploy", roles: %w{app db web}

after "deploy:publishing", "deploy:restart"
