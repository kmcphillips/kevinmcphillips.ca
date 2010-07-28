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
    required_gems = %w{ sinatra rspec rack-test data_mapper dm-sqlite-adapter haml }
    required_gems.each { |required_gem| system "sudo gem install #{required_gem}" }
  end
end

task :environment do
  require 'environment'
end

