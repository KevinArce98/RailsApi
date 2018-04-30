class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :update, :destroy]

  # GET /meetings
  def index
    # @meetings = Meeting.all
    @meetings = Meeting.all

    render json: @meetings.as_json(include:[:users, :client])
    
  end

  # GET /meetings/1
  def show
    render json: @meeting
  end

  # POST /meetings
  def create
    @meeting = Meeting.new(meeting_params)
    if @meeting.save
      @users = User.find(params[:meeting][:user_ids])
      @meeting.users << @users
      render json: @meeting, status: :created, location: @meeting
    else
      render json: @meeting.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /meetings/1
  def update
    if @meeting.update(meeting_params)
      @users = User.find(params[:meeting][:user_ids])
      @meeting.users = @users
      render json: @meeting
    else
      render json: @meeting.errors, status: :unprocessable_entity
    end
  end

  # DELETE /meetings/1
  def destroy
    @meeting.users.destroy
    @meeting.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def meeting_params
      params.require(:meeting).permit(:title, :meetDate, :isVirtual, :client_id, :user_ids)
    end
end
