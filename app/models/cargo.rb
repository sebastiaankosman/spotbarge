class Cargo < ApplicationRecord
  belongs_to :oil_company, optional: true
  has_many :bookings_as_booker, class_name: 'Booking', :foreign_key => "booker_cargo_id"
  has_many :bookings_as_booked, class_name: 'Booking', :foreign_key => "booked_cargo_id"
end

# cargos
  # has_many bookings, as bookable
# barges
  # has_many bookings, as bookable
# bookings
  # belongs_to bookable, polymorphic true
