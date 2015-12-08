class Team < ActiveRecord::Base
  validates :name, presence: { message: " vazio!" }

  has_and_belongs_to_many :users
  has_and_belongs_to_many :events
end
