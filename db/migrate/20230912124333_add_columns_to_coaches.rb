class AddColumnsToCoaches < ActiveRecord::Migration[7.0]
  def change
    add_column :coaches, :self_introduction, :text
    add_column :coaches, :qualification, :text
    add_column :coaches, :achievement, :text
    add_column :coaches, :opening_slot, :text
  end
end
