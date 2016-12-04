class Addcolumnstousers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :date_of_birth, :datetime
    add_column :users, :profession, :string
    add_column :users, :gender, :integer, default: nil
    add_column :users, :vehicle, :boolean
    add_column :users, :available_for_work, :boolean
    add_column :users, :current_location, :string
    add_column :users, :description, :text	
    add_column :users, :likes, :string
    add_column :users, :work_experience, :text	
  end
end