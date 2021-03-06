class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |airport| [airport.code, airport.id] }
    @date_options = (Flight.all.map { |flight| [flight.date_formatted, flight.departing_time.beginning_of_day ] }).uniq.sort
    
    to = params[:to_id]
    from = params[:from_id]
    time = params[:date_id]
    @num_tickets = params[:num_tickets_id]
    @search_results = Flight.all.select { |flight| flight.matches_search?(to,from,time) }
    #flash.now[:error] = "No flights match criteria" if @search_results.empty?
  end
  
  def show
    @flight = Flight.find(params[:id])
  end
end
