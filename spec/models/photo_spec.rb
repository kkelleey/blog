require 'rails_helper'

RSpec.describe Photo, type: :model do
  describe '.random' do
    it 'selects n random photos' do
      FactoryGirl.create_list :photo, 6

      result = Photo.random(3)

      expect(result.count).to eq 3
    end
  end
end
