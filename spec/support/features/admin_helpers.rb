module Features
  module AdminHelpers
    def admin
      create :user
    end

    def expect_page_to_have_header(header)
      expect(page).to have_css('h1', text: header)
    end

    def click_on_row_for(resource_name)
      find('td', text: resource_name).click
    end
  end
end

RSpec.configure do |config|
  config.include Features::AdminHelpers, type: :feature
end
