class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
     @team = Team.find(params[:id])
  end

  # GET /teams/new
  def new
    @users={}
    User.all.collect { |u| @users[u.name]=u.id }
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
    @users={}
    User.all.collect { |u| @users[u.name]=u.id }
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)
    handle_teams_users

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Equipe pronta para receber usuários.' }
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
    handle_teams_users
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
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
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def handle_teams_users
    if params['user_ids']
      @team.users.clear
      users = params['user_ids'].map { |id| User.find(id)}
      @team.users << users
    end
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name)
    end
end
