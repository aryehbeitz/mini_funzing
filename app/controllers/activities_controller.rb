class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /activities
  # GET /activities.json
  def index
    @activities = Activity.where('available_tickets > 0').all
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
    @activity=Activity.find_by_id(params[:id])
    @order = Order.new
  end

  # GET /activities/new
  def new
    @activity = Activity.new
    @activity.user = current_user
  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities
  # POST /activities.json
  def create
    @activity = current_user.activities.new(activity_params)
    @activity.available_tickets = @activity.maximum_attendees

    respond_to do |format|
      if @activity.save
        format.html { redirect_to activities_url, notice: 'Activity was successfully created.' }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    @activity = current_user.activities.find_by_id(params[:activity_id])
    @activity.assign_attributes(activity_params)
    @activity.available_tickets = @activity.maximum_attendees

    respond_to do |format|
      if @activity.save
        format.html { redirect_to activities_path(@activity), notice: 'Activity was successfully updated.' }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { redirect_to edit_activity_path(@activity) }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url, notice: 'Activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find_by_id(params[:id])
      @order = @activity.orders.first.present? ? @activity.orders.first : @activity.orders.new
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:title, :description, :maximum_attendees, :ticket_price, :date)
    end
end
