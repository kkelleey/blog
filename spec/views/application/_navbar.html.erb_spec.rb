require 'rails_helper'

RSpec.describe 'application/_navbar', type: :view do
  context 'when user is signed in' do
    it 'shows admin link' do
      sign_in
      assign_post_and_titles

      render

      expect(rendered).to link_to_admin?
      expect(rendered).to link_to_logout?
    end
  end

  context 'when user is not signed in' do
    it 'does not show the admin link' do
      assign_post_and_titles

      render

      expect(rendered).not_to link_to_admin?
      expect(rendered).not_to link_to_logout?
    end
  end
end

def link_to_admin?
  have_link('Admin', admin_root_path)
end

def link_to_logout?
  have_link('Log out', sign_out_path)
end

def assign_post_and_titles
  assign(:posts, [])
  assign(:titles, [])
end
