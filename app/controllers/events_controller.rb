class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :has_to_be_admin, only: [:new, :edit, :create, :destroy, :update]
  before_action :force_authentication, only: [:show, :index]

  # GET /events
  # GET /events.json
  def index
    user = User.find(session[:auth]['user_id'])
    if (user.rank >= User::ADMIN)
      @events = Event.all
    else
      @events = []
      Event.all.each do |event|
        if user.teams.all.any? do |team| 
          team.events.include?(event)
        end then
          @events << event
        end
      end
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @teams = @event.teams
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        @event.set_teams(params[:event][:teams])
        format.html { redirect_to @event, notice: 'Evento criado.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        @event.set_teams(params[:event][:teams])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :date, :image_url, :description)
    end
end
