FactoryGirl.define do
  factory :user do
    name "John Doe"
    email "john.doe@example.com"
    password "thisisagoodpassword,trustme"
    type 0
  end
end
