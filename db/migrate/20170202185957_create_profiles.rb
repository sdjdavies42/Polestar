class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
    	t.integer :user_id
    	t.string :company
    	t.string :name
    	t.string :location
    	t.string :phone_number
    	t.string :email
    	t.string :about
    	t.timestamps 
    end
  end
end
