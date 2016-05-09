require 'rails_helper'

RSpec.feature "AdminNavigatesToPostsShows", type: :feature do
  it 'shows the posts title and content' do
    post = create :post
    visit admin_posts_path(as: admin)
    click_on_row_for(post.title)

    expect(page).to have_content(post.title)
  end
end
