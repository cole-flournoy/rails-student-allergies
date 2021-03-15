class Student < ApplicationRecord
  has_many :enrollments
  has_many :classrooms, through: :enrollments

  has_many :severities
  has_many :allergies, through: :severities

  def display_allergies
    self.severities.map{|s| "Allergic to #{s.allergy.name} and #{s.level}"}
  end
end
