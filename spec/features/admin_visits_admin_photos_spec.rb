require 'rails_helper'
require 'support/features/admin_helpers'

RSpec.feature 'AdminVisitsAdminPhotos', type: :feature do
  it 'displays the Photos header' do
    visit admin_photos_path(as: admin)

    expect(page).to have_css('h1', text: 'Photos')
  end
end
