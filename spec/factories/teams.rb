require 'faker'

FactoryGirl.define do
	factory :team_member, parent: :team do
		
	end

  factory :team do
	name {Faker::Company.name}  
	
	team_member { create(:team_member) }
	sequence(:id)
  end

end
