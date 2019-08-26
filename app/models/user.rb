class User < ApplicationRecord
  has_many :OilCompanies
  has_many :brokers
end
