class Team < ActiveRecord::Base
  validates :name, presence: { message: " vazio!" }

  has_and_belongs_to_many :users
  has_and_belongs_to_many :events

  def set_users(users)
    self.users.clear
    users.each do |user_id|
      self.users << User.find(user_id.to_i) unless user_id == ""
    end
  end
end
