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
      @emails = booking_params[:passengers_attributes].values.map { |passenger| passenger["email"] }
      @emails.each do |email|
        PassengerMailer.thank_you_email(email, @booking).deliver
      end
      
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
  
end
