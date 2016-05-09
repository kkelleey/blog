module Features
  module AdminHelpers
    def admin
      create :user
    end

    def expect_page_to_have_header(header)
      expect(page).to have_css('h1', text: header)
    end
  end
end

RSpec.configure do |config|
  config.include Features::AdminHelpers, type: :feature
end
