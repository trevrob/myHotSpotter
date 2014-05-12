class AddAttachmentPicToHotspots < ActiveRecord::Migration
  def self.up
    change_table :hotspots do |t|
      t.attachment :pic
    end
  end

  def self.down
    drop_attached_file :hotspots, :pic
  end
end
