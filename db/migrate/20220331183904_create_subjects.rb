class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.text :name
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
