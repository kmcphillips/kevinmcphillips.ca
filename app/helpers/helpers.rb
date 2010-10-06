KevinmcphillipsCa.helpers do

  def pager_params(opts={})
    {:per_page => PAGER_PER_PAGE}.merge(opts)
  end
 
  def rot13email(email, name=nil)
    obfuscated = email.clone
    obfuscated.insert((email.length / 3) * 2, "[REMOVETHIS]").insert(email.length / 3, "[REMOVETHIS]")
    "<script>document.write('<a href=\"mailto:' + '#{email.rot13}'.rot13() + '\">#{name || "' + '#{email.rot13}'.rot13() + '"}</a>');</script><noscript><a href=\"mailto:#{obfuscated}\">#{name || obfuscated}</a></noscript>"
  end

  def nl2br(txt) 
    txt.gsub("\n", '<br />')
  end
end

