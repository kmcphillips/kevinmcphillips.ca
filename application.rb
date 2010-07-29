#!/usr/bin/ruby
require 'rubygems'
require 'sinatra'
require 'environment'

configure do
  set :views, "#{File.dirname(__FILE__)}/views"
  
  PAGES = [:bio, :resume, :projects, :code, :ceramics]
end

error do
  e = request.env['sinatra.error']
  Kernel.puts e.backtrace.join("\n")
  'Application error'
end

helpers do
  def link_to(url, name=nil, options={})
    options = options.stringify_keys
    options["href"] = url

    "<a #{options.keys.map{|k| "#{k}=\"#{options[k]}\""}.join(" ")}>#{name || url}</a>"
  end
end

## Routes

get '/' do
  haml :index
end

PAGES.each do |page|
  get "/#{page}" do
    haml page
  end
end
