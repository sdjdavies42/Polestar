class AddAttachmentImage2ToCars < ActiveRecord::Migration
  def self.up
    change_table :cars do |t|
      t.attachment :image2
    end
  end

  def self.down
    remove_attachment :cars, :image2
  end
end
