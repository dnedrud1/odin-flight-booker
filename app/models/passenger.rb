class Passenger < ActiveRecord::Base
  has_many :bookings, foreign_key: "passenger_id", dependent:   :destroy
  has_many :flights, through: :bookings
  
  validates :name, presence: true
  validates :email, presence: true

end
