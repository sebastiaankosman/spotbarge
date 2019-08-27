class Booking < ApplicationRecord
  belongs_to :booker_cargo, class_name: 'Cargo', optional: true
  belongs_to :booked_cargo, class_name: 'Cargo', optional: true
  belongs_to :booked_barge, class_name: 'Barge', optional: true
  belongs_to :booker_barge, class_name: 'Barge', optional: true
end
