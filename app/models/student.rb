class Student < ApplicationRecord
  has_many :enrollments
  has_many :classrooms, through: :enrollments
  has_many :severities
  has_many :allergies, through: :severities
  
  validates :first_name, :last_name, :lunch_period, presence: true
  validates :grade, numericality: { only_integer: true, greater_than: 0 }
  
  scope :has_allergy, -> { joins(:allergies).uniq }

  def display_allergies
    self.severities.map{|s| "#{s.allergy.category}: #{s.allergy.name} - Requires #{s.level}"}
  end

  def self.last_name_search(query)
    Student.where("last_name LIKE ?", "%#{query}%")
  end 

end
