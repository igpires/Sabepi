class CreateClassrooms < ActiveRecord::Migration[5.2]
  def change
    create_table :classrooms do |t|
      t.string :access_code
      t.references :user, foreign_key: true
      t.string :name
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
