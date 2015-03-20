require 'active_record'

ActiveRecord::Base.establish_connection(
    :adapter => 'mysql2',
    :host => DATABASE_HOST,
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

  #exercise
  has_many :user_roles
  has_many :roles, through: :user_roles
end

#exercise
class Role < ActiveRecord::Base
  self.table_name = :role
  has_many :user_roles
  has_many :users, through: :user_roles
end

#exercise
class UserRole <ActiveRecord::Base
  self.table_name = :user_role

  belongs_to :role
  belongs_to :user
end

# can also do Movie.all
sql = 'select * from movie'
movies_from_db = Movie.find_by_sql(sql)
puts movies_from_db.length
movies_from_db.each do |movie|
  puts movie.title
end