require 'rails_helper'

RSpec.feature "UserVisitsPostsPages", type: :feature do
  describe "when user visits posts page" do
    it "displays the 5 most recent posts" do
      posts = FactoryGirl.create_list :post, 6
      visit posts_path

      expect(page).to have_content(posts.last.title)
      expect(page).not_to have_content(posts.first.title)
    end
  end
end
