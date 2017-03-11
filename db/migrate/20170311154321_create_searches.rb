class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.string :keywords
      t.string :make
      t.string :model
      t.string :transmission

      t.timestamps
    end
  end
end
