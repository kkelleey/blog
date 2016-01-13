class AddCityToPhotos < ActiveRecord::Migration
  def change
    add_reference :photos, :city, index: true, foreign_key: true
  end
end
