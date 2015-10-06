class User < ActiveRecord::Base
  # User ranks constants
  PENDING = 0
  ACCEPTED = 1
  SUPER = 7

  has_secure_password
  validates :name, presence: { message: "Nome vazio!" } 
  validates :password, 
    length: { minimum: 6, message: "A senha deve ter pelo menos 6 caracteres." },
    confirmation: { message: "A Confirmação da Senha está errada." }

  validates :email, 
      presence: { message: "Precisamos do seu email!" },
      confirmation: { message: "A Confirmação do Email está errada." },
      uniqueness: { message: "Esse email já foi cadastrado :(" }, 
      format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/, message: "Email inválido!"}

  before_create :override_rank

  def override_rank
    self.rank = 0
  end
end
