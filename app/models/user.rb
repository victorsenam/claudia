class User < ActiveRecord::Base
  # Constantes de tipos de usuários (quanto maior o número, maior a permissão)
  PENDING = 0
  ACCEPTED = 1
  SUPER = 7

  has_secure_password
  validates :name, presence: true
  validates :password, length: {minimum: 6}
  validates :email, presence: true, confirmation: true, uniqueness: true, format: {with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/}

  before_create :override_type

  def override_type
    self.type = 0
  end
end
