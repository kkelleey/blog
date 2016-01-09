FactoryGirl.define do  factory :photo do
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
    title "MyString"
text "MyText"
  end

end
