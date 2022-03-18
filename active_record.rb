require "pry"
require "active_record"

# Setup a database connection, once establish_connection is run, ActiveRecord::Base keeps it stored as a class variable at ActiveRecord::Base.connection
ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "db/students.sqlite"
)

# Create a Students table
sql = <<-SQL
  CREATE TABLE IF NOT EXISTS students (
    id INTEGER PRIMARY KEY,
    name TEXT
  )
SQL
ActiveRecord::Base.connection.execute(sql)

# Log SQL output to the terminal
ActiveRecord::Base.logger = Logger.new(STDOUT)

# Have the Student class inherit from ActiveRecord::Base, telling out calss to make use of Active Record's built in ORM  methods. We're also making our class(student) a subclass of ActiveRecord::Base.
class Student < ActiveRecord::Base
end

binding.pry
""
