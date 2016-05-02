FactoryGirl.define do
  factory :city do
    sequence(:name) { |n| "City_#{n}" }
    latitude 1.5
    longitude 1.5
    country

    trait :with_no_photos do
      photos_count 0
    end

    trait :with_photos do
      photos_count 10
    end

    factory :city_with_no_photos, traits: [:with_no_photos]
    factory :city_with_photos, traits: [:with_photos]

    factory :city_with_a_photo do
      after(:create) { |city| city.photos << create(:photo) }
    end

    factory :city_with_a_photo_and_post do
      after(:create) { |city| city.photos << create(:photo) }
      after(:create) { |city| city.posts << create(:post) }
    end
  end
  factory :photo do
    image { File.new("#{Rails.root}/spec/support/fixtures/image.jpg") }
  end
  factory :country do
    name 'MyString'
  end
  factory :user do
    name 'MyString'
    email 'email@example.com'
    password 'MyString'
  end
  factory :post do
    sequence(:title) { |n| "Post #{n}" }
    text 'MyText'
    city
  end
end
