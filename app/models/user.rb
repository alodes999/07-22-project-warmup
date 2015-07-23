class User < ActiveRecord::Base
  include BCrypt
  has_many :tasks
  
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

end
