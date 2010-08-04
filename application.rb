#!/usr/bin/ruby
require 'rubygems'
require 'sinatra'
require 'environment'

configure do
  PAGES = [:bio, :resume, :projects, :code]
  EMAIL = "admin@kevinmcphillips.ca"
  TITLE = "kevinmcphillips.ca"
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
  
  def render(*args)
    if args.first.is_a?(Hash) && args.first.keys.include?(:partial)
      options = args.first
      partial = options.delete(:partial)
      if object = options.delete(:object)
        options[:locals] = (options[:locals] || {}).merge(partial.to_sym => object)
      end
      
      return haml "_#{partial}".to_sym, options.merge(:layout => false)
    else
      super
    end
  end
  
  def rot13email(email, name=nil)
    obfuscated = email.clone
    obfuscated.insert((email.length / 3) * 2, "[REMOVETHIS]").insert(email.length / 3, "[REMOVETHIS]")
    "<script>document.write('<a href=\"mailto:' + '#{email.rot13}'.rot13() + '\">#{name || "' + '#{email.rot13}'.rot13() + '"}</a>');</script><noscript><a href=\"mailto:#{obfuscated}\">#{name || obfuscated}</a></noscript>"
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
    @projects = Project.all if page == :projects    
    haml page
  end
end
