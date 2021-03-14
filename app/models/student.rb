class Student < ApplicationRecord
  has_and_belongs_to_many :classrooms
  has_many :severities
  has_many :allergies, through: :severities
  accepts_nested_attributes_for :classrooms

  def display_allergies
    self.severities.map{|s| "Allergic to #{s.allergy.name} and #{s.level}"}
  end
end
