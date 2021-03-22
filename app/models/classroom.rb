class Classroom < ApplicationRecord
  belongs_to :user
  has_many :enrollments
  has_many :students, through: :enrollments
  validates :period, numericality: { only_integer: true, greater_than: 0 }
  validates :subject, presence: true
  validates :teacher, presence: true

  def allergy_count
    count = 0
    self.students.each{|s| count += s.allergies.count}
    count
  end
end
