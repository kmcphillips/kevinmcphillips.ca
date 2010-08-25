#!/usr/bin/ruby
require 'rubygems'
require 'sinatra'
require 'environment'
require 'helpers'

configure do
  PAGES = [:bio, :resume, :projects, :code]
  EMAIL = "admin@kevinmcphillips.ca"
  TITLE = "Kevin McPhillips"
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

## Put the helpers in another file for clarity and to make them testable
# 
helpers do
  include Helpers
end


## Routes

get '/stylesheet.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :stylesheet
end

get '/' do
  @skip_footer = true
  haml :index
end

PAGES.each do |page|
  get "/#{page}" do
    @projects = Project.all if page == :projects    
    @title = page.to_s.humanize
    haml page
  end
end

