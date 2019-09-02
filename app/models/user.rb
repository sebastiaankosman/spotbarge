class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :oil_company
  has_one :broker

  def broker?
    !!self.broker
  end

  def oil_company?
    !!self.oil_company
  end
end
