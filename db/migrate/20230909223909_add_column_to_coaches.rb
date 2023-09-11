class AddColumnToCoaches < ActiveRecord::Migration[7.0]
  def change
    add_column :coaches, :image_name, :string
  end
end
