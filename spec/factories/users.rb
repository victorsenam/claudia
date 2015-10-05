require 'faker'

FactoryGirl.define do
  factory :user do
    sequence(:id)
    name { Faker::Name.name }
    email { Faker::Internet.email("#{name}") }
    password { Faker::Internet.password(8, 30) }
    rank 0
  end

end
