class Classroom < ApplicationRecord
  belongs_to :user
  has_many :enrollments
  has_many :students, through: :enrollments

  def allergy_count
    count = 0
    self.students.each{|s| count += s.allergies.count}
    count
  end
end
