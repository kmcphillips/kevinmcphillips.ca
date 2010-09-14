DataMapper.setup(:default, "sqlite3://" + Padrino.root('db', "kevinmcphillips.ca.db"))
DataMapper.logger = logger
