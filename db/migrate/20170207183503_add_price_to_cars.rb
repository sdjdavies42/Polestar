class AddPriceToCars < ActiveRecord::Migration[5.0]
  def change
  	add_column :cars, :price, :string
  end
end
