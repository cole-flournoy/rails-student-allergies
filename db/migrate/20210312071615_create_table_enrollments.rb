class CreateTableEnrollments < ActiveRecord::Migration[6.1]
  def change
    create_table :enrollments do |t|
     t.belongs_to :student
     t.belongs_to :classroom
    end
  end
end
