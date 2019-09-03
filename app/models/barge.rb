class Barge < ApplicationRecord
  belongs_to :broker, optional: true
  has_many :bookings_as_booker, class_name: 'Booking', :foreign_key => "booker_barge_id"
  has_many :bookings_as_booked, class_name: 'Booking', :foreign_key => "booked_barge_id"

  scope :by_area, ->(area) { where("barge_area = ?", area) }
  scope :by_product, ->(product) { where("barge_type = ? ", product) }
  scope :by_volume, ->(volumes) {
    min_volume = volumes.first
    max_volume = volumes.last

    if min_volume && max_volume
      where(capacity: min_volume..max_volume)
    elsif min_volume
      where("capacity <= ? ", min_volume)
    elsif max_volume
      where("capacity > ? ", max_volume)
    end
  }
  scope :by_load_window, ->(load_window) { where("barge_load_window = ?", load_window) }
  # scope :by_location, ->(location) { where("barge_area = ?", location) }
  geocoded_by :barge_area
  after_validation :geocode, if: :will_save_change_to_barge_area?
end
