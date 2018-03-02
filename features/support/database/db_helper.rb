require 'active_record'

#option
#ActiveRecord::Base.pluralize_table_names = false

ActiveRecord::Base.establish_connection(
    adapter: 'mysql2',
    host: DATABASE_HOST,
    username: 'tester',
    password: 'P4ssw0rd',
    database: 'movietix'
)

#TODO replace all uses of ActiveRecord::Base with ApplicationRecord
