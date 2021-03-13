class CreateClassrooms < ActiveRecord::Migration[6.1]
  def change
    create_table :classrooms do |t|
      t.string :period
      t.string :subject
      t.string :teacher
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
