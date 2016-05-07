require 'rails_helper'

RSpec.feature 'AdminVisitsAdminRoots', type: :feature do
  it 'displays Posts header' do
    visit admin_root_path

    expect(page).to have_css('h1', text: 'Posts')
  end
end
