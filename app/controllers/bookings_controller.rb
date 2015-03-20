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
      @passenger = Passenger.new(value)
      @booking = @flight.bookings.new(passenger_id: @passenger.id)
      if @passenger.save && @booking.save
        flash[:success] = "Flight sucessfully booked!"
        redirect_to @flight
      else
        flash[:error] = "Flight not booked"
        redirect_to root_path
      end
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
