class AddPasswordToCoaches < ActiveRecord::Migration[7.0]
  def change
    add_column :coaches, :password, :string
  end
end
