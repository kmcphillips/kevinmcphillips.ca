require 'rubygems'
require 'sinatra' unless defined?(Sinatra)

## gem install sinatra haml data_objects do_sqlite3 dm-core dm-validations dm-timestamps dm-aggregates dm-migrations dm-sqlite-adapter
require 'haml'
require 'sass'
require 'rubygems'
require 'dm-core'
require 'dm-sqlite-adapter'
require 'dm-validations'
require 'dm-timestamps'
require 'dm-aggregates'
require 'dm-migrations'

configure do
  set :views, "#{File.dirname(__FILE__)}/views"
  
  # load models
  $LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")
  Dir.glob("#{File.dirname(__FILE__)}/lib/*.rb") { |lib| require File.basename(lib, '.*') }
  
  # setup database
  DataMapper::Logger.new($stdout, :debug)
  
  DataMapper.setup(:default, 'sqlite::memory:')
  
  # get the DB all ready to go
  DataMapper.finalize
  DataMapper.auto_migrate!
  
  # seed the database
  Seed.process!
end


## Core extensions

class Hash
  def stringify_keys
    inject({}) do |options, (key, value)|
      options[key.to_s] = value
      options
    end
  end
  
  def stringify_keys!
    replace self.stringify_keys
  end
end

class String
  def rot13
    split("").inject("") do |accu, char|
      accu << if ("a".."z").to_a.to_s.index(char.downcase)
        rot = ("a".."z").to_a[(("a".."z").to_a.to_s.index(char.downcase) + 13) % 26]
        ("A".."Z").to_a.include?(char) ? rot.upcase : rot
      else
        char
      end
    end
  end
end
