require 'active_record'

ActiveRecord::Base.establish_connection(
    :adapter => 'mysql2',
    :host => $database_host,
    :username => 'tester',
    :password => 'P4ssw0rd',
    :database => 'movietix'
)

class Movie < ActiveRecord::Base
end

class Showtime < ActiveRecord::Base
end

class Theater < ActiveRecord::Base
end

class Purchase < ActiveRecord::Base
end

class User < ActiveRecord::Base
end

# can also do Movie.all
sql = 'select * from Movies'
movies_from_db = Movie.find_by_sql(sql)
puts movies_from_db.length
movies_from_db.each do |movie|
  puts movie.name
end