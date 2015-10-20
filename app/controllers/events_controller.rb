class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]

	def index
		@events = Event.all
		respond_to do |format|
			format.json
		end
	end

  def show
    @event = Event.find(params[:id])
    @response = current_user.responses.find_by(event: @event.id) || current_user.responses.build
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Event Created"
      redirect_to @event
    else
      render 'new'
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = "Event updated"
      redirect_to @event
    else
      render 'edit'
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    flash[:success] = "Event deleted"
    redirect_to root_url
  end
	
  private

    def event_params
      params.require(:event).permit(:title, :description, :all_day, :start_datetime, :end_datetime, :user)
    end

    def correct_user
      @event = current_user.events.find_by(id: params[:id])
      redirect_to root_url if @event.nil?
    end

end
