require 'rails_helper'

RSpec.feature 'UserVisitsPostsPages', type: :feature do
  describe 'when user visits posts page' do
    it "displays the post's title" do
      FactoryGirl.create :post, title: 'First post title'
      visit posts_path

      expect(page).to have_content('First post title')
    end
  end

  describe 'when user visits posts page and post has no photos' do
    it "does not display 'See all photos from CityWithoutPhotos'" do
      city = FactoryGirl.create :city_with_no_photos, name: 'CityWithNoPhotos'
      post = FactoryGirl.create :post, city_id: city.id
      visit posts_path

      expect(page).to have_css 'h3.post-title', text: post.title
      expect(page).not_to have_content('See all photos from CityWithoutPhotos')
    end
  end

  describe 'when user visits posts page and post has photos' do
    it "displays 'See all photos from CityWithPhotos'" do
      city = FactoryGirl.create :city_with_photos, name: 'CityWithPhotos'
      FactoryGirl.create :post, city_id: city.id
      visit posts_path

      expect(page).to have_link(
        'See all photos from CityWithPhotos', href: "/photos?by_city=#{city.id}"
      )
    end
  end
end
