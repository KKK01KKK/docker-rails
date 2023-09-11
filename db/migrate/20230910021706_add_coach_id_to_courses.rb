class AddCoachIdToCourses < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :coach_id, :integer
  end
end
