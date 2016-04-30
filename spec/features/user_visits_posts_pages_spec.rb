require 'rails_helper'

RSpec.feature 'UserVisitsPostsPages', type: :feature do
  describe 'user visits posts page' do
    it "displays the post's title" do
      FactoryGirl.create :post, title: 'First post title'
      visit posts_path

      expect(page).to have_content('First post title')
    end

    scenario 'post has no photos' do
      city = FactoryGirl.create :city_with_no_photos, name: 'CityWithNoPhotos'
      post = FactoryGirl.create :post, city_id: city.id
      visit posts_path

      expect(page).to have_css 'h3.post-title', text: post.title
      expect(page).not_to have_content('See all photos from CityWithoutPhotos')
    end

    scenario 'when post has photos' do
      city = FactoryGirl.create :city_with_photos, name: 'CityWithPhotos'
      FactoryGirl.create :post, city_id: city.id
      visit posts_path

      expect(page).to have_link(
        'See all photos from CityWithPhotos', href: "/photos?by_city=#{city.id}"
      )
    end

    scenario 'when user is signed in' do
      user = FactoryGirl.create :user, email: 'email@example.com', password: 'password'
      visit posts_path(as: user)

      expect(page).to have_link('Admin', admin_root_path)
    end

    scenario 'when user is not signed in' do
      visit posts_path

      expect(page).not_to have_link('Admin', admin_root_path)
    end
  end
end
