class AddAttachmentLogoToCountries < ActiveRecord::Migration
  def self.up
    change_table :countries do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :countries, :logo
  end
end
