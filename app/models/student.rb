class Student < ApplicationRecord
  belongs_to :classroom
  has_many :severities
  has_many :allergies, through: :severities
end
