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
      "<script>document.write('<a href=\"mailto:' + '#{email.rot13}'.rot13() + '\">#{name || "' + '#{email.rot13}'.rot13() + '"}</a>');</script><noscript><a href=\"mailto:#{obfuscated}\">#{name || obfuscated}</a></noscript>"
    end

  end

end

class String
  def rot13
    tr("A-Ma-mN-Zn-z","N-Zn-zA-Ma-m")
  end
end
