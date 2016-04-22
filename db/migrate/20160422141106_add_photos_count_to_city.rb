class AddPhotosCountToCity < ActiveRecord::Migration
  def change
    add_column :cities, :photos_count, :integer, default: 0
  end
end
