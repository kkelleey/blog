class Post < ActiveRecord::Base
  belongs_to :city
  scope :by_country, -> country do
    joins(:city).where(cities: { country_id: country })
  end
  scope :by_city, -> city { where(city: city) }

  def self.with_city
    joins(:city)
  end

  # this must be chained after with_city
  def self.with_photos_boolean
    joins(
      %{
        LEFT OUTER JOIN (
          SELECT photos.city_id, COUNT(*) > 0 as has_photos
          FROM photos
          GROUP BY photos.city_id
          ) a on a.city_id = cities.id
      }
    ).select('posts.*, cities.name, a.has_photos')
  end
end
