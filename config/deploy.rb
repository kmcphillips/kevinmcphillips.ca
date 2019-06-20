lock '3.6.1'

set :application, 'kevinmcphillips.ca'
set :repo_url, 'https://github.com/kmcphillips/kevinmcphillips.ca.git'

set :user, "deploy"
set :rbenv_ruby, "2.6.0"

# Default value for :linked_files is []
# append :linked_files, 'config/database.yml', 'config/secrets.yml'

# Default value for linked_dirs is []
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/.well-known'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 2

# Puma
set :puma_user, 'deploy'
