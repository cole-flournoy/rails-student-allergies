class User < ApplicationRecord
  has_many :classrooms
  has_secure_password
end
