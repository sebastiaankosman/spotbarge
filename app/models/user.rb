class User < ApplicationRecord
  has_many :oil_companies
  has_many :brokers
end
