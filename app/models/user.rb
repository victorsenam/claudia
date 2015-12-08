class User < ActiveRecord::Base
  # User ranks constants
  PENDING = 0
  ACCEPTED = 1
  ADMIN = 6
  SUPER = 7

  HUMANIZED_ATTRIBUTES = {
    :password => "Senha",
    :password_confirmation => "Confirmação de senha",
    :email => "Email",
    :email_confirmation => "Confirmação de email",
    :name => "Nome"
  }

  def self.human_attribute_name(attr, options={})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end


  validates :name, presence: { message: " vazio!" }

  validates :password, 

    confirmation: { message: " não bate." },
    length: { minimum: 6, message: " deve ter pelo menos 6 caracteres." }

  validates :email, 
    presence: { message: "é um campo obrigatório." },
    uniqueness: { message: " já foi cadastrado no sistema :(" }, 
    format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/, message: " inválido!"},
    confirmation: { message: " não bate." }

  before_create :override_rank
  before_validation :normalize_email

  has_secure_password

  has_and_belongs_to_many :teams

  def override_rank
    self.rank = PENDING
  end

  def normalize_email
    self.email.downcase! if self.email
  end


  def self.search(search)
    if search
      self.where("name like ?", "%#{search}%")
    else
      self.all
    end
  end
end
