class AddAttachmentImage5ToCars < ActiveRecord::Migration
  def self.up
    change_table :cars do |t|
      t.attachment :image5
    end
  end

  def self.down
    remove_attachment :cars, :image5
  end
end
