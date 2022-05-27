class CreateAnswerOccurrences < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_occurrences do |t|
      t.references :class_occurrence, foreign_key: true
      t.references :answers, foreign_key: true
      t.references :student, foreign_key: true
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
