module TeamsHelper
  def set_team_users(team, users)
    team.users.clear
    users.each do |user_id|
      team.users << User.find(user_id.to_i) unless user_id == ""
    end
  end
end
