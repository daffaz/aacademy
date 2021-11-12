require 'pg'

def execute(sql)
  conn = PG::Connection.open(dbname: 'sqlzoo', user: 'postgres', password: 'makanbaso')
  query_result = conn.exec(sql).values
  conn.close

  query_result
end
