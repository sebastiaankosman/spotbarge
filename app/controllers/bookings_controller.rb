class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @barge = Barge.find(params[:id])
    if @booking.save!
      redirect_to barge_booking_path(@barge, @booking)
    else
      render :new
    end
  end

  def show
    @barge = Barge.find(params[:id])
    @cargo = Cargo.find(params[:id])
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:freight_rate, :free_hours, :demurrage_rate, :short_notice, :comment)
  end
end
