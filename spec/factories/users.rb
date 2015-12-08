require 'faker'

FactoryGirl.define do
  factory :user do
    sequence(:id,2)
    name { Faker::Name.name }
    email { Faker::Internet.email("#{name}") }
    password { Faker::Internet.password(8, 30) }
    rank 0

    factory :user_ranked do
      to_create do |instance| 
        rank = instance.rank
        instance.save!
        instance.rank = rank
        instance.save!
      end
    end
  end
end
