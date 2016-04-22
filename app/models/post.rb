class Post < ActiveRecord::Base
  belongs_to :city, counter_cache: true
  has_many :photos, through: :city
  scope :with_location, -> { includes(:city) }
  scope :by_country, (lambda do |country|
    joins(:city).where(cities: { country_id: country })
  end)
  scope :by_city, -> (city) { where(city: city) }
end
