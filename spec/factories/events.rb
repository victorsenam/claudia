require 'faker'

FactoryGirl.define do
  factory :event do
    name Faker::Hipster.sentence(2, true, 1)
    date Faker::Time.between(Time.new(2016, 7, 24, 12, 0, 0), Time.new(2016, 7, 30, 14, 0, 0))
    image_url Faker::Placeholdit.image("400x400")
    description Faker::Lorem.sentence
  end

end
