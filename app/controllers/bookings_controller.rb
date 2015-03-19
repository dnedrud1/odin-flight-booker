class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    
    @flight = Flight.find(params[:flight_id])
    @num_tickets = params[:num_tickets_id].to_i
    @num_tickets.times { @flight.passengers.build }
  end
  
  def create
    @passengers = passenger_params[:passengers_attributes]
    @flight = Flight.find(flight_params[:flight_id])
    @passengers.each do |key, value|
      @passenger = Passenger.create(value)
      @booking = @flight.bookings.create(passenger_id: @passenger.id)
    end
  end
  
  private
  
  def passenger_params
    params.require(:flight).permit(passengers_attributes: [:id, :name, :email])
  end
  
  def flight_params
    params.require(:flight).permit(:flight_id)
  end
end
