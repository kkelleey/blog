class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.belongs_to :country, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
