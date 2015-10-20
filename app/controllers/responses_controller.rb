class ResponsesController < ApplicationController
  before_action :authenticate_user!

  def for_user
    @upcoming_responses = current_user.responses.select{|r| r.event.end_datetime >= Time.now}
    @upcoming_responses.sort_by! {|r| r.event.start_datetime}
    @old_responses = current_user.responses.select{|r| r.event.end_datetime < Time.now}
    @old_responses.sort_by! {|r| r.event.end_datetime}.reverse!
  end

  def for_event
    @responses = Event.find(params[:event_id]).responses
    @responses_y = @responses.select{|r| r.response == 1}
    @responses_m = @responses.select{|r| r.response == 0}
    @responses_n = @responses.select{|r| r.response == -1}
  end

  def create
    @response = current_user.responses.build(response_params)
    @response.event_id = params[:event_id]
    if @response.save
      flash[:success] = "Response saved"
    else
      flash[:danger] = "Response failed"
    end
    redirect_to @response.event || request.referrer
  end

  def update
    @response = Response.find(params[:id])
    if @response.update_attributes(response_params)
      flash[:success] = "Response updated"
    else
      flash[:danger] = "Error updating response"
    end
    redirect_to @response.event
  end

  def destroy
    @response = Response.find(params[:id]).destroy
    flash[:success] = "Response removed"
    redirect_to @response.event
  end

  private

    def response_params
      params.require(:response).permit(:response, :user, :event)
    end

end
