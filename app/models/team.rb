class Team < ActiveRecord::Base
	validates :name,
		presence: {message: "Denomine a nova equipe."}

			
	has_many :team_members
	has_many :users, :through => :team_members

	validates :team_members, presence: {message: "Time sem usuários."}
end