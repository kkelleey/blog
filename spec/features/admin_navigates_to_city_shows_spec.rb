require 'rails_helper'
require 'support/features/admin_helpers'

RSpec.feature "AdminNavigatesToCityShows", type: :feature do
  it 'shows the city latitude and longitude' do
    city = create :city
    visit admin_cities_path(as: admin)
    click_on_row_for(city)

    expect(page).to have_content(city.latitude)
    expect(page).to have_content(city.longitude)
  end

  def click_on_row_for(city)
    find('td', text: city.name).click
  end
end
