require 'rails_helper'

RSpec.feature 'AdminVisitsAdminCities', type: :feature do
  it 'displays a Cities header' do
    visit admin_cities_path

    expect(page).to have_css('h1', text: 'Cities')
  end
end
