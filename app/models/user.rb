class User < ActiveRecord::Base
  # User ranks constants
  PENDING = 0
  ACCEPTED = 1
  SUPER = 7

  has_secure_password
  validates :name, presence: { message: "Nome vazio!" } 
  validates :password, length: { minimum: 6, message: "Senha muito pequena!" }
  # TODO , confirmation: { message: "Confirme seu email!" }
  validates :email, presence: { message: "Precisamos do seu email!" },
      confirmation: true, 
      uniqueness: true, 
      format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/, message: "Email inválido!"}

  before_create :override_rank

  def override_rank
    self.rank = 0
  end
end
