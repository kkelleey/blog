class Tile
  def self.generate_tiles(n)
    tiles = [title_tile] + country_logo_tiles
    # tiles += random_photo_tiles(n - tiles.count)
    tiles.shuffle
  end

  private

  def self.title_tile
    {
      src: :title_tile,
      href: '#',
      class: 'title-tile',
    }
  end

  def self.country_logo_tiles
    Country.all.map do |country|
      {
        src: country.logo.url,
        href: Rails.application.routes.url_helpers.posts_path(by_country: country.id),
        class: 'logo',
      }
    end
  end

  def self.random_photo_tiles(n)
    Photo.random(n).map do |photo|
      {
        src: photo.image.url(:medium),
        href: '#',
        class: 'photo',
      }
    end
  end
end
