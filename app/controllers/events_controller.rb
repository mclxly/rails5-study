class EventsController < ApplicationController
  # respond_to :html, :xml, :json

  before_filter :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy, :accept_request, :reject_request]
  before_action :event_owner!, only:[:edit,:update,:destroy]

  # GET /events
  # GET /events.json
  def index
    # send email twice
    # UserMailer.welcome_email(current_user).deliver_later
    UserMailer.welcome_email(current_user).deliver_now

    if params[:tag]
      @events = Event.tagged_with(params[:tag])
    else
      @events = Event.all
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @attendees = Event.show_accepted_attendees(@event.id)
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
    @event.organizer_id = current_user.id
    # byebug
    # @event = current_user.organized_events.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
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

  def join
    @attendance = Attendance.join_event(current_user.id,
      params[:event_id], 'request_sent')
    'Request Sent' if @attendance.save
    # respond_with @attendance
  end

  def accept_request
    @attendance = Attendance.find_by(id: params[:attendance_id]) rescue nil
    @attendance.accept!
    'Applicant Accepted' if @attendance.save
    # respond_with(@attendance)
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Accepted.' }
      format.json { head :no_content }
    end
  end

  def reject_request
    @attendance = Attendance.where(id: params[:attendance_id]).first rescue nil
    @attendance.reject!
    'Applicant Rejected' if @attendance.save
    # respond_with(@attendance)
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Rejected.' }
      format.json { head :no_content }
    end
  end

  def my_events
    @events = current_user.organized_events
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      # @event = Event.find(params[:id])
      
      if params[:event_id].present?
        params[:id] = params[:event_id]
      end

      @event = Event.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :start_date, :end_date, :location, 
        :agenda, :address, :organizer_id, :all_tags)
    end

    def event_owner!
      authenticate_user!

      if current_user.email === 'colin.lin@newbiiz.com'
        return true
      end

      if @event.organizer_id != current_user.id
        redirect_to events_path
        flash[:notice] = '您没有此操作权限！'
        
      end
      
    end
end
