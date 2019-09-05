require "render_anywhere"

class Download
  include RenderAnywhere

  def initialize(booking)
    @booking = booking
  end

  def to_pdf(current_user)
    kit = PDFKit.new(as_html(current_user), page_size: 'A4', dpi: 1600)
    kit.to_file("tmp/booking.pdf")
  end

  def filename
    "Booking #{booking.id}.pdf"
  end

  private

  attr_reader :booking

  def as_html(current_user)
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
    render template: "bookings/pdf",
      layout: "booking_pdf",
      locals: { booking: booking, oil_company: @oil_company, broker: @broker, barge: @barge, cargo: @cargo }
  end
end
