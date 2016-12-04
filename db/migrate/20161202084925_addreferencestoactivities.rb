class Addreferencestoactivities < ActiveRecord::Migration[5.0]
  def change
  	add_reference :activities, :company, foreign_key: true
  end
end
