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
      city = create :city_with_photos
      city.posts << create(:post)
      other_city = create :city
      city.photos << create(:photo)
      other_city.photos << create( :photo, image:  File.new("#{Rails.root}/spec/support/fixtures/image2.jpg"))
      visit root_path
      click_on "See all photos from #{city.name}"

      expect(page).to have_content("Photos of #{city.name}")
      expect(page).to have_css('img[src*="image.jpg"]')
      expect(page).not_to have_css('img[src*="image2.jpg"]')
    end
  end
end
