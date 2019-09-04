class BookingsController < ApplicationController
  def new
    fix_params
    @booking = Booking.new
    @user = current_user
    if @user.oil_company?
      @cargos = Cargo.where(oil_company_id: current_user.oil_company.id)
      @barge = Barge.find(params[:barge_id])
    elsif @user.broker?
      @barges = Barge.where(broker_id: current_user.broker.id)
      @cargo = Cargo.find(params[:cargo_id])
    end
  end

  def create
    @booking = Booking.new(booking_params)
    @user = current_user
    # raise
    if @user.oil_company?
      @booking.booker_cargo_id = params[:booking][:booker_cargo_id]
      @booking.booked_barge_id = params[:barge_id]

      if @booking.save!
        redirect_to barge_booking_path(params[:barge_id], @booking.id)
      else
        render :new
      end
      # @booking.booked_barge_id = params[:barge_id]
    elsif @user.broker?
      @booking.booker_barge_id = params[:booking][:booker_barge_id]
      @booking.booked_cargo_id = params[:cargo_id]
      if @booking.save!
        redirect_to cargo_booking_path(params[:cargo_id], @booking.id)
      else
        render :new
      end
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
      @oil_company = @user.oil_company
      @broker = @booking.booked_barge.broker
      @barge = @booking.booked_barge
      @cargo = @booking.booker_cargo
      # @barge = Barge.find(params[:barge_id])
      # @booking = Booking.find(params[:id])
      # @booker = Cargo.find(@booking.booker_cargo_id)
      # @booked = Barge.find @booking.booked_barge_id
    elsif @user.broker?
      # @booking = Booking.find(params[:id])
      @broker = @user.broker
      @oil_company = @booking.booked_cargo.oil_company
      @cargo = @booking.booked_cargo
      @barge = @booking.booker_barge
      # @booker = Barge.find(@booking.booker_barge_id)
      # @booked = Cargo.find @booking.booked_cargo_id
    end
    # Creating PDF file.
    # respond_to do |format|
    #   format.html
    #   format.pdf do
    #     render pdf: "booking_confirmation" # Excluding ".pdf" extension.
    #   end
    # end
  end

  private

  def fix_params
    params[:cargo_id] = params[:cargo_id].split("/").first if params[:cargo_id]
    params[:barge_id] = params[:barge_id].split("/").first if params[:barge_id]
  end

  def booking_params
    params.require(:booking).permit(:booker_cargo_id, :booker_barge_id, :freight_rate, :free_hours, :demurrage_rate, :short_notice, :comment)
  end
end
