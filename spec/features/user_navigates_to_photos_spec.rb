require 'rails_helper'

RSpec.feature "UserNavigatesToPhotos", type: :feature do
  describe "user clicks photos link" do
    it "navigates to photos index" do
      visit root_path
      click_on 'Photos'

      expect(page).to have_current_path(photos_path)
    end
  end
end
