class Flight < ActiveRecord::Base
    belongs_to :to_airport, class_name: "Airport"
    belongs_to :from_airport, class_name: "Airport"
    
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
