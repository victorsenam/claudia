class SessionsController < ApplicationController
  def new
    @errors ||= flash[:errors] || []
  end

  def create
    user = User.find_by_email( params[:email] )
    if user && user.authenticate( params[:password] )
      if user.rank == User::PENDING
        flash[:errors] = ["Usuário pendente, por favor, aguarde sua aceitação no sistema."]
        redirect_to '/sessions/new'
      else
        session[:auth] = { user_id: user.id, login_time: Time.now() }
        flash[:notice] = "Logado com Sucesso!"
        redirect_to '/users'
      end
    else
      flash[:errors] = ["Usuário Inválido"]
      redirect_to '/sessions/new'
    end
  end

  def destroy
    reset_session
    flash[:notice] = "Deslogado com Sucesso!"
    redirect_to '/sessions/new'
  end
end
