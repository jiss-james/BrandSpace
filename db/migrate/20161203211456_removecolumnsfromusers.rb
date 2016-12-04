class Removecolumnsfromusers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :likes
  end
end
