class CreateSeverities < ActiveRecord::Migration[6.1]
  def change
    create_table :severities do |t|
      t.string :name
      t.belongs_to :allergy, null: false, foreign_key: true
      t.belongs_to :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
