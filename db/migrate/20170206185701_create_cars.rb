class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
    	t.integer :user_id
    	t.string :year
    	t.string :make
    	t.string :model
    	t.string :miles
    	t.string :transmission
    	t.text :description
    	t.timestamps
    end
  end
end
