class EventsController < ApplicationController
  before_action :authenticate_user!

	def index
		@events = Event.all
		respond_to do |format|
			format.json
		end
	end

  def show
    @event = Event.find(params[:id])
  end
	
end
