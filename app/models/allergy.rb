class Allergy < ApplicationRecord
  has_many :severities
  has_many :students, through: :severities
end
