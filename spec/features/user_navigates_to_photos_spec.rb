require 'rails_helper'

RSpec.feature 'UserNavigatesToPhotos', type: :feature do
  describe 'user clicks photos link in navbar' do
    it 'navigates to photos index' do
      visit root_path
      click_on 'Photos'

      expect(page).to have_current_path(photos_path)
    end
  end

  describe 'user clicks "See all photos from {city}"' do
    it 'displays only photos from that city' do
      city = create :city_with_a_photo_and_post
      other_city = create_other_city_with_photo
      visit root_path
      click_on "See all photos from #{city.name}"

      expect(page).to have_content("Photos of #{city.name}")
      expect(page).to display_first_photo_from(city)
      expect(page).not_to display_first_photo_from(other_city)
    end
  end

  def create_other_city_with_photo
    city = create :city
    create_photo_for(city)
    city
  end

  def create_photo_for(city)
    city.photos << create(:photo, image:  File.new(image_2_path))
  end

  def image_2_path
    "#{Rails.root}/spec/support/fixtures/image2.jpg"
  end

  def display_first_photo_from(city)
    have_css("img[src*='#{city.photos.first.image_file_name}']")
  end
end
