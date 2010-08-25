module Helpers
  def link_to(name, url=nil, options={})
    options = options.stringify_keys
    options["href"] = url || name

    "<a #{options.keys.sort.map{|k| "#{k}=\"#{options[k]}\""}.join(" ")}>#{name}</a>"
  end
  
  def image_tag(url, options={})
    options = options.stringify_keys
    options["src"] = url
  
    "<img #{options.keys.sort.map{|k| "#{k}=\"#{options[k]}\""}.join(" ")} />"
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
