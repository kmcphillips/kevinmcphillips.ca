require 'rubygems'
require 'haml'
require 'sinatra' unless defined?(Sinatra)

configure do
  SiteConfig = OpenStruct.new(
                 :title => 'kevinmcphillips.ca',
                 :author => 'Kevin McPhillips',
                 :url_base => 'http://kevinmcphillips.ca/'
               )
end

