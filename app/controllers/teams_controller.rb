class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :force_authentication, only: [:index, :show]
  before_action :has_to_be_admin, only: [:new, :edit, :create, :delete, :update]

  # GET /teams
  # GET /teams.json
  def index
    user = User.find(session[:auth]['user_id'])
    if (user.rank >= User::ADMIN)
      @teams = Team.all
    else
      @teams = user.teams.all
    end
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @users = @team.users
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        @team.set_users(params[:team][:users])
        format.html { redirect_to @team, notice: 'O time foi criado com Sucesso.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        @team.set_users(params[:team][:users])
        format.html { redirect_to @team, notice: 'O time foi atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'O time foi destruído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name)
    end
end
