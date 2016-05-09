module Features
  module AdminHelpers
    def admin
      create :user
    end
  end
end

RSpec.configure do |config|
  config.include Features::AdminHelpers, type: :feature
end
