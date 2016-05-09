require 'rails_helper'

RSpec.feature 'AdminVisitsAdminCountries', type: :feature do
  it 'displays Countries header' do
    admin = create :user
    visit admin_countries_path(as: admin)

    expect(page).to have_css('h1', text: 'Countries')
  end
end
