class BookingsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @user = current_user
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @product = Product.find(params[:product_id])
    @user = current_user
    @booking.product = @product
    @booking.user = @user
    #flash[:notice] = "something"
    #flash[:alert] = "something more dangerous"
    if @booking.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.update(status: true)
    redirect_to dashboard_path
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.update(status: false)
    redirect_to dashboard_path
  end

   private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
