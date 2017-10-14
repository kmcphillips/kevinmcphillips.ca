require "sinatra/base"
require "json"

class KevinMcphillipsApp < Sinatra::Application
  set :erb, format: :html5

  get '/' do
    erb :index
  end

  get '/stylesheet.css' do
    scss :stylesheet
  end

  get '/ping' do
    'OK'
  end

  helpers do
    def obfuscated_email(text:nil, link_class:"")
      obfuscated = "#{ email_parts.to_json }.reverse().join('@')"
      "<script>
        document.write('<a href=\"mailto:' + #{ obfuscated } + '\" class=\"#{ link_class }\">#{ text || ["' + ", obfuscated, " + '"].join }</a>');
      </script>"
    end

    def email_parts
      ["hello", "kevinmcphillips.ca"].reverse
    end
  end
end
