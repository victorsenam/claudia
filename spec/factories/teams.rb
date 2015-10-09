require 'faker'

FactoryGirl.define do
  factory :team do
	name {Faker::Company.name}    
	sequence(:id)

  end

end
