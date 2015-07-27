class KevinMcphillipsApp < Sinatra::Base
  set :haml, format: :html5

  get '/' do
    @email = rot13email(["hello", "@", "kevinmcphillips.ca"].join(""))
    haml :index
  end

  get '/stylesheet.css' do
    scss :stylesheet
  end


  helpers do

    def rot13email(email, name=nil)
      obfuscated = email.clone.insert((email.length / 3) * 2, "[REMOVETHIS]").insert(email.length / 3, "[REMOVETHIS]")
      "<script>document.write('<a href=\"mailto:' + rot13('#{ rot13(email) }') + '\">#{name || "' + rot13('#{ rot13(email) }') + '"}</a>');</script><noscript><a href=\"mailto:#{obfuscated}\">#{name || obfuscated}</a></noscript>"
    end

    def rot13(string)
      string.tr("A-Ma-mN-Zn-z","N-Zn-zA-Ma-m")
    end

  end

end
