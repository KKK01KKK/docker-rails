class AddColumnsToCourses < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :subject, :string
    add_column :courses, :content, :text
    add_column :courses, :price, :integer
    add_column :courses, :period, :integer
    add_column :courses, :thumbnail, :string
  end
end
