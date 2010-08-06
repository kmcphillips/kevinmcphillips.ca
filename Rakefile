require 'spec/rake/spectask'

task :default => :test
task :test => :spec

if !defined?(Spec)
  puts "spec targets require RSpec"
else
  desc "Run all examples"
  Spec::Rake::SpecTask.new('spec') do |t|
    t.spec_files = FileList['spec/**/*.rb']
  end
end

namespace :gems do
  desc 'Install required gems'
  task :install do
    required_gems = %w{ sinatra rspec rack-tes dm-sqlite-adapter haml data_objects do_sqlite3 dm-core dm-validations dm-timestamps dm-aggregates dm-migrations sinatra-content-for}
    required_gems.each { |required_gem| system "sudo gem install #{required_gem}" }
  end
end

task :environment do
  require 'environment'
end

namespace :db do
  desc 'Seed the database'
  task :seed => :environment do
    DataManager.seed!
  end
  
  desc 'Migrate (WARNING: destructive)'
  task :migrate => :environment do
    DataManager.migrate!
  end
end

