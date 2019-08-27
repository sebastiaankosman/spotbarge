class Broker < ApplicationRecord
  belongs_to :user
  has_many :barges
end
