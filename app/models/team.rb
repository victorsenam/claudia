class Team < ActiveRecord::Base
	validates :name,
		presence: {message: "Denomine a nova equipe."}
			
	has_many :team_members
	has_many :users, :through => :team_members
end

class TeamMember < ActiveRecord::Base
	belongs_to :user
	belongs_to :team
end
