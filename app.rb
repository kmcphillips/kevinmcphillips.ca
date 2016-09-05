class KevinMcphillipsApp < Sinatra::Base
  set :haml, format: :html5

  get '/' do
    haml :index
  end

  get '/stylesheet.css' do
    scss :stylesheet
  end

  get '/beta' do
    erb :beta
  end

  get '/beta_stylesheet.css' do
    scss :beta_stylesheet
  end

  helpers do
    def my_email
      ["hello", "@", "kevinmcphillips.ca"].join("")
    end

    def obfuscated_email(email, name:nil, link_class:"")
      obfuscated = email.clone.insert((email.length / 3) * 2, "[REMOVETHIS]").insert(email.length / 3, "[REMOVETHIS]")
      "<script>document.write('<a href=\"mailto:' + rot13('#{ rot13(email) }') + '\" class=\"#{link_class}\">#{name || "' + rot13('#{ rot13(email) }') + '"}</a>');</script><noscript><a href=\"mailto:#{obfuscated}\">#{name || obfuscated}</a></noscript>"
    end

    def rot13(string)
      string.tr("A-Ma-mN-Zn-z","N-Zn-zA-Ma-m")
    end
  end
end
