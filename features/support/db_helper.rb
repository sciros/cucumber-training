require 'active_record'

#option
#ActiveRecord::Base.pluralize_table_names = false

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
end
