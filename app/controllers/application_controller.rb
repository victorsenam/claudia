class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def force_authentication
    if !session[:auth]
      flash[:errors] = ["Por favor, faça o login"]
      return redirect_to sessions_new_path
    elsif session[:auth][:login_time] < 10.days.ago
      flash[:errors] = ["Sua sessão expirou"]
      return redirect_to sessions_destroy_path
    elsif !User.exists?(session[:auth][:user_id])
      flash[:errors] = ["Ocorreu um erro inesperado, tente logar novamente"]
      return redirect_to sessions_destroy_path
    else
      session[:auth][:login_time] = Time.now()
    end
  end

  def has_to_be_admin
    force_authentication

    if User.find(session[:auth][:user_id]).rank < User::ADMIN
      flash[:errors] = ["Você deve ser admin para acessar esta página"]
      return redirect_to root_path
    end
  end
end
