class Addcolumnstocompanies < ActiveRecord::Migration[5.0]
  def change
  	add_column :companies, :company_name, :string
  	add_column :companies, :description, :text
  	add_column :companies, :location, :string
  end
end

