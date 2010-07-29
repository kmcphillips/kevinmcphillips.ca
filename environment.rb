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
