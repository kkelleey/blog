require 'rails_helper'

RSpec.feature 'AdminVisitsAdminCountries', type: :feature do
  it 'displays Countries header' do
    visit admin_countries_path

    expect(page).to have_css('h1', text: 'Countries')
  end
end
