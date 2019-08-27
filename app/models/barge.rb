class Barge < ApplicationRecord
  belongs_to :broker, optional: true
  has_many :bookings_as_booker, class_name: 'Booking', :foreign_key => "booker_barge_id"
  has_many :bookings_as_booked, class_name: 'Booking', :foreign_key => "booked_barge_id"
end
