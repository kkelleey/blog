require 'rails_helper'

RSpec.feature 'AdminVisitsAdminRoot', type: :feature do
  scenario 'signed in' do
    visit admin_root_path(as: admin)

    expect_page_to_have_header 'Posts'
  end

  scenario 'not signed in' do
    visit admin_root_path

    expect(current_path).to eq(root_path)
    expect(page).to have_content('You do not have access to that page')
  end
end
