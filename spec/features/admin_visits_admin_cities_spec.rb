require 'rails_helper'
require 'support/features/admin_helpers'

RSpec.feature 'AdminVisitsAdminCities', type: :feature do
  it 'displays a Cities header' do
    visit admin_cities_path(as: admin)

    expect(page).to have_css('h1', text: 'Cities')
  end
end
