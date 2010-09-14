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
    tr("A-Ma-mN-Zn-z","N-Zn-zA-Ma-m")
  end
  
  def titleize
    humanize.split(" ").map{|x| x.capitalize}.join(" ")
  end
end
