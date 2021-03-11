class Student < ApplicationRecord
  belongs_to :classroom
  has_many :severities
  has_many :allergies, through: :severities

  def display_allergies
    self.severities.map{|s| "Allergic to #{s.allergy.name} and #{s.name}"}
  end
end
