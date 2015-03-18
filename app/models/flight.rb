class Flight < ActiveRecord::Base
    belongs_to :to_airport, class_name: "Airport"
    belongs_to :from_airport, class_name: "Airport"
    
    has_many :bookings, foreign_key: "flight_id", dependent:   :destroy
    has_many :passengers, through: :bookings
    
    validates :departing_time, presence: true
    validates :duration, presence: true
    validates :from_airport_id, presence: true
    validates :to_airport_id, presence: true
    
  def date_formatted
    departing_time.strftime("%m/%d/%Y")
  end
  
  def datetime_formatted
    departing_time.strftime("%m/%d/%Y %I:%M%p")
  end
  
  def matches_search?(to,from,time)
      if self.to_airport.id == to.to_i && self.from_airport.id == from.to_i && self.departing_time.beginning_of_day == time.to_datetime
          true
      else
          false
      end
  end
end
