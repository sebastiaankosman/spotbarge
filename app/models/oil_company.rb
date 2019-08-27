class OilCompany < ApplicationRecord
  belongs_to :user
  has_many :cargos
end
