class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @user = current_user
    if @user.oil_company?
      @barge = Barge.find(params[:barge_id])
    elsif @user.broker?
      @cargo = Cargo.find(params[:cargo_id])
    end
  end

  def create
    @booking = Booking.new(booking_params)
    @user = current_user
    if @user.oil_company?
      @booking.booker_cargo_id = params[:booker_cargo_id]
      @booking.booked_barge_id = params[:barge_id]
      if @booking.save!
        redirect_to barge_booking_path(@barge, @booking)
      else
        render :new
      end
      # @booking.booked_barge_id = params[:barge_id]
    elsif @user.broker?
      # @booking.booker_barge_id = current_user.id
      # @cargo = Cargo.find(params[:cargo_id])
      # if @booking.save!
      #   redirect_to cargo_booking_path(@cargo, @booking)
      # else
      #   render :new
      # end
      # @booking.booked_cargo_id = params[:cargo_id]
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @user = current_user

    if @user.oil_company?
      @barge = Barge.find(params[:barge_id])
      # @booking = Booking.find(params[:id])
      # @booker = Cargo.find(@booking.booker_cargo_id)
      # @booked = Barge.find @booking.booked_barge_id
    elsif @user.broker?
      # @booking = Booking.find(params[:id])
      @cargo = Cargo.find(params[:cargo_id])
      # @booker = Barge.find(@booking.booker_barge_id)
      # @booked = Cargo.find @booking.booked_cargo_id
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:freight_rate, :free_hours, :demurrage_rate, :short_notice, :comment)
  end
end
