class BookingsController < ApplicationController
  def show
    @barge = Barge.find(params[:id])
    @cargo = Cargo.find(params[:id])
    @booking = Booking.find(params[:id])
  end
end
