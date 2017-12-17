class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.where(user: current_user)
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Activity.find_by_id(params[:activity_id]).orders.new
    @order.user = current_user;
    @order.number_of_tickets = order_params[:number_of_tickets]
    @order.total_price = @order.number_of_tickets * @order.activity.ticket_price
    respond_to do |format|
      if validate_quantity? && @order.save 
        #redirect_to admin_campaign_path(campaign), notice: 'Canceled!'
        # format.html { redirect_to @activity, notice: 'Order was successfully created.' }
        format.html { redirect_to order_confirmation_path(@order), notice: 'Order was successfully created.' }
      else
        format.html { redirect_to @order.activity, alert: 'Not enough places!' }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /orders/comfirmation/:order_id
  def confirmation
    @order=Order.find_by_id(params[:order_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
      @activity = @order.activity
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:number_of_tickets)
      # i need to require activity_id too ;)
    end

    def validate_quantity?
      tickets_remaining = @order.activity.available_tickets - @order.number_of_tickets
      if (tickets_remaining >= 0)
        @order.activity.update(available_tickets: tickets_remaining)
        return true
      end
      return false
    end
end
