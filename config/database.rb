DataMapper.logger = logger

case Padrino.env
  when :test 
    DataMapper.setup(:default, "sqlite3://" + Padrino.root('db', "kevinmcphillips.ca_test.db"))
  else
    DataMapper.setup(:default, "sqlite3://" + Padrino.root('db', "kevinmcphillips.ca.db"))
end
