class Tile
  # returns array of image urls, plus :title_tile
  def self.generate_tiles(n)
    tiles = [:title_tile]
    tiles += get_country_logo_tiles
    random_photos = Photo.random(n - tiles.count)
    tiles += random_photos.map { |photo| photo.image.url(:medium) }
    tiles.shuffle
  end

  private

  def self.get_country_logo_tiles
    Country.all.map { |country| country.logo.url(:medium) }
  end

end
