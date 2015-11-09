class UsersController < ApplicationController
  before_action only: [:show, :edit, :update, :destroy] { set_user(params) }
  before_action :force_authentication, only: [:show, :edit, :update, :destroy, :index, :update_ranks]
  before_action :has_to_be_admin, only: [:index, :update_ranks]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def update_ranks
    params[:rank].each do |user_id, user_rank|
      user = User.find(user_id)
      user.update_attribute(:rank, user_rank)
    end

    redirect_to '/users'
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to sessions_new_path, notice: 'Sucesso! Aguarde a confirmação do seu cadastro' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user(params)
      return false unless force_authentication
      params = {id: session[:auth]['user_id']} if !params or params[:id] == nil
      return false unless params[:id].to_i == session[:auth]['user_id'].to_i or has_to_be_admin

      if !User.exists?(params[:id])
        flash[:errors] = ["Usuário não existente"]
        redirect_to root_path
        return false
      end
      @user = User.find(params[:id])
      return true
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :email_confirmation, :password, :password_confirmation, :password_digest, :rank)
    end

end
