class AddIsActiveToClassrooms < ActiveRecord::Migration[5.2]
  def change
    add_column :classrooms, :is_active, :boolean, :default => false
  end
end
