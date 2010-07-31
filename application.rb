#!/usr/bin/ruby
require 'rubygems'
require 'sinatra'
require 'environment'

configure do
  set :views, "#{File.dirname(__FILE__)}/views"
  
  PAGES = [:bio, :resume, :projects, :code]
  EMAIL = "admin@kevinmcphillips.ca"
  
  # TODO
  class Project; def self.all; [] ; end ; end
end

## Error documents

not_found do
  haml :'404'
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
  
  def rot13email(email, name=nil)
    obfuscated = email.clone
    obfuscated.insert((email.length / 3) * 2, "[REMOVETHIS]").insert(email.length / 3, "[REMOVETHIS]")
    "<script>document.write('<a href=\"mailto:' + '#{email.rot13}'.rot13 + '\">#{name || "' + '#{email.rot13}'.rot13 + '"}</a>');</script><noscript><a href=\"mailto:#{obfuscated}\">#{name || obfuscated}</a></noscript>"
  end
end

## Routes

get '/stylesheet.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :stylesheet
end

get '/' do
  haml :index
end

PAGES.each do |page|
  get "/#{page}" do
    haml page
  end
end
