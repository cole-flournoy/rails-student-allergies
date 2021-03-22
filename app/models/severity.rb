class Severity < ApplicationRecord
  belongs_to :allergy
  belongs_to :student
  validates :level, presence: true
end
