class ChangeCoachesColumns < ActiveRecord::Migration[7.0]
  def change
    add_column :coaches, :password_digest, :string
    remove_column :coaches, :password, :string
  end
end
