class CreateClassOccurrences < ActiveRecord::Migration[5.2]
  def change
    create_table :class_occurrences do |t|
      t.references :classroom, foreign_key: true
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
