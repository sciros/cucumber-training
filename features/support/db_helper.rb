require 'active_record'

ActiveRecord::Base.establish_connection(
    :adapter => 'mysql2',
    :host => $database_host,
    :username => 'tester',
    :password => 'P4ssw0rd',
    :database => 'movietix'
)

class Movie < ActiveRecord::Base
  self.table_name = :movie #ActiveRecord default is plural 'movies'
end

class Showtime < ActiveRecord::Base
  self.table_name = :showtime
end

class Theater < ActiveRecord::Base
  self.table_name = :theater
end

class Purchase < ActiveRecord::Base
  self.table_name = :purchase
end

class User < ActiveRecord::Base
  self.table_name = :user
end

# can also do Movie.all
sql = 'select * from movie'
movies_from_db = Movie.find_by_sql(sql)
puts movies_from_db.length
movies_from_db.each do |movie|
  puts movie.title
end