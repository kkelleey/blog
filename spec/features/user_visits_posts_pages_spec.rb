require 'rails_helper'

RSpec.feature "UserVisitsPostsPages", type: :feature do
  describe "when user visits posts page" do
    it "displays the post's title" do
      FactoryGirl.create :post, title: 'First post title'
      visit posts_path

      expect(page).to have_content('First post title')
    end
  end

  describe "when user visits posts page and post has no photos" do
    it "does not display 'See all photos from CityWithoutPhotos'" do
      city = FactoryGirl.create :city, name: 'CityWithoutPhotos'
      FactoryGirl.create :post, city_id: city.id
      visit posts_path

      expect(page).not_to have_content('See all photos from CityWithoutPhotos')
    end
  end

  describe "when user visits posts page and post has photos" do
    it "displays 'See all photos from CityWithPhotos'" do
      city = FactoryGirl.create :city, name: 'CityWithPhotos'
      FactoryGirl.create :post, city_id: city.id
      FactoryGirl.create :photo, city_id: city.id
      visit posts_path

      expect(page).to have_content('See all photos from CityWithPhotos')
    end
  end
end

