class Allergy < ApplicationRecord
  has_many :severities
  has_many :students, through: :severities
  validates :name, :category, presence: true
end
