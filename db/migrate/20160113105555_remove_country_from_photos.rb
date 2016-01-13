class RemoveCountryFromPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :country_id, :integer
  end
end
