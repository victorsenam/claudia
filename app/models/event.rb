class Event < ActiveRecord::Base
  validates :name, presence: { message: " vazio!" }

  has_and_belongs_to_many :teams

  def set_teams(teams)
    self.teams.clear
    teams.each do |team_id|
      self.teams << Team.find(team_id.to_i) unless team_id == ""
    end unless teams == nil
  end
end
