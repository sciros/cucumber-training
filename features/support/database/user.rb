class User < ActiveRecord::Base
  self.table_name = :user

  has_and_belongs_to_many :roles, join_table: :user_role
end