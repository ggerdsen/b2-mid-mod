class FlightsController<ApplicationController
  
  def index
    @flights = Flight.all
  end
  
  def update
    flight = Flight.find(params[:flight_id])
    passenger = flight.passengers.find(params[:passenger_id])
    passenger_flight = PassengerFlight.where(passenger_id: passenger.id, flight_id: flight.id)
    PassengerFlight.destroy(passenger_flight.first.id)
    redirect_to "/flights"
  end
  
end