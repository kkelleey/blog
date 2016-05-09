require 'rails_helper'
require 'support/features/admin_helpers'

RSpec.feature 'AdminVisitsAdminPhotos', type: :feature do
  it 'displays the Photos header' do
    visit admin_photos_path(as: admin)

    expect_page_to_have_header 'Photos'
  end
end
