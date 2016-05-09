require 'rails_helper'

RSpec.feature 'AdminVisitsAdminPhotos', type: :feature do
  it 'displays the Photos header' do
    admin = create :user
    visit admin_photos_path(as: admin)

    expect(page).to have_css('h1', text: 'Photos')
  end
end
