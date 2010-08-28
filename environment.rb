require 'rubygems'
require 'sinatra' unless defined?(Sinatra)

require 'haml'
require 'sass'
require 'sinatra/content_for'
require 'dm-core'
require 'dm-sqlite-adapter'
require 'dm-validations'
require 'dm-aggregates'
require 'dm-migrations'

configure do
  set :views, "#{File.dirname(__FILE__)}/views"
  
  # load models
  $LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")
  Dir.glob("#{File.dirname(__FILE__)}/lib/*.rb") { |lib| require File.basename(lib, '.*') }
  
  # setup database
  DataMapper::Logger.new($stdout, :debug)
  
  DataMapper.setup(:default, "sqlite3:///#{File.expand_path(File.dirname(__FILE__))}/kevinmcphillips.ca.db")
  
  # this doesn't seem to be necessary
  #DataMapper.finalize
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
    tr("A-Ma-mN-Zn-z","N-Zn-zA-Ma-m")
  end
  
  def titleize
    gsub("_", " ").split(" ").map{|x| x.capitalize}.join(" ")
  end
  
  def humanize
    gsub("_", " ").capitalize
  end
end

