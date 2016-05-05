class TileList
  attr_reader :tiles

  def initialize
    @tiles = [title_tile] + country_logo_tiles
    @tiles.shuffle
  end

  private

  def title_tile
    {
      src: :title_tile,
      href: '#',
      class: 'title-tile'
    }
  end

  def country_logo_tiles
    Country.all.map do |country|
      {
        src: country.logo.url,
        href: posts_path_for(country),
        class: 'logo'
      }
    end
  end

  def posts_path_for(country)
    Rails.application.routes.url_helpers.posts_path(by_country: country.id)
  end
end
