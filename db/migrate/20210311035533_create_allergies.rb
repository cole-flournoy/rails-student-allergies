class CreateAllergies < ActiveRecord::Migration[6.1]
  def change
    create_table :allergies do |t|
      t.string :name
      t.string :category

      t.timestamps
    end
  end
end
