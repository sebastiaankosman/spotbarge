class Cargo < ApplicationRecord
  belongs_to :oil_company, optional: true
  has_many :bookings_as_booker, class_name: 'Booking', :foreign_key => "booker_cargo_id"
  has_many :bookings_as_booked, class_name: 'Booking', :foreign_key => "booked_cargo_id"

  scope :by_area, ->(area) { where("load_location = ?", area) }
  scope :by_product, ->(product) { where("cargo_type = ?", product) }
  scope :by_volume, ->(volumes) {
    min_volume = volumes.first
    max_volume = volumes.last

    if min_volume && max_volume
      where(volume: min_volume..max_volume)
    elsif min_volume
      where("volume <= ?", min_volume)
    elsif max_volume
      where("volume > ?", max_volume)
    end
  }
  scope :by_load_window, ->(load_window) { where("cargo_load_window = ?", load_window) }
end
