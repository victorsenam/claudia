class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def force_authentication
    if !session[:auth]
      flash[:errors] = ["Por favor, faça o login"]
      redirect_to sessions_new_path
      return false
    elsif session[:auth]['login_time'] < 10.days.ago
      flash[:errors] = ["Sua sessão expirou"]
      redirect_to sessions_destroy_path
      return false
    elsif !User.exists?(session[:auth]['user_id'])
      flash[:errors] = ["Ocorreu um erro inesperado, tente logar novamente"]
      redirect_to sessions_destroy_path
      return false
    elsif User.find(session[:auth]['user_id']).rank < User::ACCEPTED
      flash[:errors] = ["O seu cadastro ainda não foi aceito. Tente novamente mais tarde"]
      redirect_to sessions_destroy_path
      return false
    else
      session[:auth]['login_time'] = Time.now()
      return true
    end
  end

  def has_to_be_admin
    return false unless force_authentication

    if User.find(session[:auth]['user_id']).rank < User::ADMIN
      flash[:errors] = ["Você deve ser admin para acessar esta página"]
      redirect_to root_path
      return false
    end
    return true
  end
end
