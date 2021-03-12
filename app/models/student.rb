class Student < ApplicationRecord
  has_and_belongs_to_many :classrooms
  has_many :severities
  has_many :allergies, through: :severities

  def display_allergies
    self.severities.map{|s| "Allergic to #{s.allergy.name} and #{s.name}"}
  end
end
