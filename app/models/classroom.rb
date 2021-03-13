class Classroom < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :students

  def allergy_count
    count = 0
    self.students.each{|s| count += s.allergies.count}
    count
  end
end
