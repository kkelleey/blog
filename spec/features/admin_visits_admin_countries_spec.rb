require 'rails_helper'

RSpec.feature 'AdminVisitsAdminCountries', type: :feature do
  it 'displays Countries header' do
    visit admin_countries_path(as: admin)

    expect_page_to_have_header 'Countries'
  end
end
