FactoryGirl.define do  factory :city do
    latitude 1.5
longitude 1.5
country nil
  end
  factory :photo do
    country nil
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
  end

end
