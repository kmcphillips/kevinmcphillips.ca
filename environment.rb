require 'rubygems'
require 'haml'
require 'sass'
require 'sinatra' unless defined?(Sinatra)

configure do
  SiteConfig = OpenStruct.new(
                 :title => 'kevinmcphillips.ca',
                 :author => 'Kevin McPhillips',
                 :url_base => 'http://kevinmcphillips.ca/'
               )
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
