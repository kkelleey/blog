FactoryGirl.define do
  factory :city do
    latitude 1.5
    longitude 1.5
    country
  end
  factory :photo do
    sequence(:city_id)
  end
  factory :country do
    name "MyString"
  end
  factory :user do
    name "MyString"
    password "MyString"
  end
  factory :post do
    sequence(:title) { |n| "Post #{n}" }
    text "MyText"
    city
  end
end
