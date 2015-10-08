class SessionsController < ApplicationController
  def new
    @errors ||= flash['errors'] || []
  end

  def create
      user = User.find_by_email( params[:email] )
      if user && user.authenticate( params[:password] )
        session[:user_id] = user.id
        flash['notice'] = "Logado com Sucesso!"
        redirect_to '/users'
      else
        flash['error'] = "Usuário Inválido"
        redirect_to '/sessions/new'
      end
  end

  def destroy
      session.destroy(:user_id)
  end
end
