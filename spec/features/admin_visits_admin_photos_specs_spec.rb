require 'rails_helper'

RSpec.feature 'AdminVisitsAdminPhotosSpecs', type: :feature do
  it 'displays the Photos header' do
    visit admin_photos_path

    expect(page).to have_css('h1', text: 'Photos')
  end
end
