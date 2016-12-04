class Addcolumnstoactivities < ActiveRecord::Migration[5.0]
  def change
  	add_column :activities, :activity_name, :string
  	add_column :activities, :description, :text
  	add_column :activities, :start_date, :datetime
  	add_column :activities, :end_date, :datetime	
  	add_column :activities, :location, :string
  	add_column :activities, :vehicle, :boolean
  	add_column :activities, :mobile, :string
  	add_column :activities, :telephone, :string
  end
end
