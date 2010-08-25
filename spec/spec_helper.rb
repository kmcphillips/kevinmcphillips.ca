require File.join(File.dirname(__FILE__), '..', 'application.rb')

require 'rubygems'
require 'sinatra'
require 'spec'
require 'spec/interop/test'
require 'rack/test'

# setup test environment
Sinatra::Base.set :environment, :test
Sinatra::Base.set :run, false
Sinatra::Base.set :raise_errors, true
Sinatra::Base.set :logging, false

# setup the test db
DataMapper.setup(:default, "sqlite3::memory:")
DataMapper::Logger.new("/dev/null", :off)

Spec::Runner.configure do |config|
  config.before(:each) { DataMapper.auto_migrate! }
end

