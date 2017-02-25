class AddAttachmentImage3ToCars < ActiveRecord::Migration
  def self.up
    change_table :cars do |t|
      t.attachment :image3
    end
  end

  def self.down
    remove_attachment :cars, :image3
  end
end
