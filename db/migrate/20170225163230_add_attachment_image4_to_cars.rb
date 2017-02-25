class AddAttachmentImage4ToCars < ActiveRecord::Migration
  def self.up
    change_table :cars do |t|
      t.attachment :image4
    end
  end

  def self.down
    remove_attachment :cars, :image4
  end
end
