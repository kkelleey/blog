require 'rails_helper'
require 'support/features/admin_helpers'

RSpec.feature 'AdminVisitsAdminCities', type: :feature do
  it 'displays a Cities header' do
    visit admin_cities_path(as: admin)

    expect_page_to_have_header 'Cities'
  end
end
