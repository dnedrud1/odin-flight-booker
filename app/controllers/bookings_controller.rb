class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    
    @flight = Flight.find(params[:flight_id])
    @num_tickets = params[:num_tickets_id].to_i
    @num_tickets.times { @booking.passengers.build }
  end
  
  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      flash[:success] = "Booking Created!"
      redirect_to @booking
    else
      flash.now[:error] = "Booking not saved"
      render 'new'
    end
  end
  
  def show
    @booking = Booking.find(params[:id])
  end
  
  private
  
  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email])
  end
  
  def passengers_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email])
  end
end
