require 'rails_helper'

RSpec.describe 'posts/index', type: :view do
  context 'when post has no photos' do
    it 'does not show link to photos from city' do
      city = create :city_with_no_photos
      post = create_post(city)
      assign_posts_and_tiles(post)

      render

      expect(rendered).to show_post_title(post.title)
      expect(rendered).not_to link_to_photos_from_city?(city)
    end
  end

  context 'when post has photos' do
    it 'shows link to photos from city' do
      city = create :city_with_photos
      post = create_post(city)
      assign_posts_and_tiles(post)

      render

      expect(rendered).to link_to_photos_from_city?(city)
    end
  end
end

private

def assign_posts_and_tiles(post)
  assign(:posts, [post])
  assign(:tiles, [])
end

def show_post_title(title)
  have_css 'h3.post-title', text: title
end

def create_post(city)
  create :post, city_id: city.id
end

def link_to_photos_from_city?(city)
  have_link(city_link_text(city), href: photos_path(by_city: city.id))
end

def city_link_text(city)
  "See all photos from #{city.name}"
end
