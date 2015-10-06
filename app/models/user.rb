class User < ActiveRecord::Base
  # User ranks constants
  PENDING = 0
  ACCEPTED = 1
  SUPER = 7

  validates :name, presence: { message: "Nome vazio!" }

  validates :password, 
    presence: { message: "Precisamos de uma senha!" },
    confirmation: { message: "Senha não bate" },
    length: { minimum: 6, message: "A senha deve ter pelo menos 6 caracteres." }

  validates :email, 
      presence: { message: "Precisamos do seu email!" },
      uniqueness: { message: "Esse email já foi cadastrado :(" }, 
      format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/, message: "Email inválido!"},
      confirmation: { message: "Email não bate" }

  before_create :override_rank
  before_validation :normalize_email

  def override_rank
    self.rank = 0
  end

  def normalize_email
      self.email.downcase!
  end
end
