class DownloadsController < ApplicationController
  def show
    respond_to do |format|
      format.pdf { send_booking_pdf }
    end
  end

  private

  def booking
    Booking.find(params[:booking_id])
  end

  def download
    Download.new(booking)
  end

  def send_booking_pdf
    send_file download.to_pdf(current_user), download_attributes
  end

  def download_attributes
    {
      filename: download.filename,
      type: "application/pdf",
      disposition: "inline"
    }
  end
end
