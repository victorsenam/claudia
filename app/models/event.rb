class Event < ActiveRecord::Base
  validates :name, presence: { message: " vazio!" }

  has_and_belongs_to_many :teams
end
