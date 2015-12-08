class Event < ActiveRecord::Base
  validates :name, presence: { message: " vazio!" }
end
