class City < ActiveRecord::Base
  belongs_to :country
  has_many :posts
  has_many :photos

  def self.coordinates
    all.map do |city|
      {
        name: city.name,
        lat: city.latitude,
        longitude: city.longitude,
        postUrl: city.post_url
      }
    end
  end

  def post_url
    if posts_count > 0
      Rails.application.routes.url_helpers.posts_path(by_city: id)
    end
  end
end
