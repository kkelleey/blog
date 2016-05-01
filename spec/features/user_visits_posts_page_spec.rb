require 'rails_helper'

RSpec.feature 'UserVisitsPostsPages', type: :feature do
  describe 'user visits posts page' do
    it "displays the post's title" do
      post = create :post
      visit posts_path

      expect(page).to have_content(post.title)
    end

    scenario 'when user is signed in' do
      user = create :user
      visit posts_path(as: user)

      expect(page).to link_to_admin?
    end

    scenario 'when user is not signed in' do
      visit posts_path

      expect(page).not_to link_to_admin?
    end
  end

  private

  def link_to_admin?
    have_link('Admin', admin_root_path)
  end

  def link_to_photos_from_city?(city)
    have_link(city_link_text(city), href: photos_path(by_city: city.id))
  end

  def city_link_text(city)
    "See all photos from #{city.name}"
  end

  def show_post_title(title)
    have_css 'h3.post-title', text: title
  end

  def create_post(city)
    create :post, city_id: city.id
  end
end
