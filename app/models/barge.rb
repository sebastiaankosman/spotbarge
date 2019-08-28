class Barge < ApplicationRecord
  belongs_to :broker, optional: true
  has_many :bookings_as_booker, class_name: 'Booking', :foreign_key => "booker_barge_id"
  has_many :bookings_as_booked, class_name: 'Booking', :foreign_key => "booked_barge_id"

  scope :by_area, ->(area) { where("barge_area = ?", area) }
  scope :by_product, ->(product) { where("barge_type = ? ", product) }
  scope :by_volume, ->(volume) { where("capacity = ?", volume) }
  scope :by_load_window, ->(load_window) { where("barge_load_window = ?", load_window) }
  scope :by_barge_area, ->(location) { where("barge_area = ?", location) }
end
