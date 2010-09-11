KevinmcphillipsCa.helpers do
 
  def rot13email(email, name=nil)
    obfuscated = email.clone
    obfuscated.insert((email.length / 3) * 2, "[REMOVETHIS]").insert(email.length / 3, "[REMOVETHIS]")
    "<script>document.write('<a href=\"mailto:' + '#{email.rot13}'.rot13() + '\">#{name || "' + '#{email.rot13}'.rot13() + '"}</a>');</script><noscript><a href=\"mailto:#{obfuscated}\">#{name || obfuscated}</a></noscript>"
  end

end

