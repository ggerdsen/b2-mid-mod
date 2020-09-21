require 'rails_helper'

RSpec.describe "Passengers index page" do
  before :each do
    @airline = Airline.create!(name: "Frontier")
    @flight_1 = @airline.flights.create(number: 1234,
                                      date: "9/21/20",
                                      time: "09:00",
                                      departure_city: "Denver",
                                      arrival_city: "Helena")
    @flight_2 = @airline.flights.create(number: 4321,
                                      date: "09/23/20",
                                      time: "19:00",
                                      departure_city: "Helena",
                                      arrival_city: "Denver")
    @flight_3 = @airline.flights.create(number: 1111,
                                      date: "09/23/20",
                                      time: "19:00",
                                      departure_city: "Helena",
                                      arrival_city: "Denver")
    @flight_4 = @airline.flights.create(number: 2222,
                                      date: "09/23/20",
                                      time: "19:00",
                                      departure_city: "Helena",
                                      arrival_city: "Denver")
    @passenger_1 = Passenger.create(name: "John Smith",
                                              age: 29)
    @passenger_2 = Passenger.create(name: "Mary Smith",
                                              age: 33)
    @passenger_3 = Passenger.create(name: "Jacob Smith",
                                              age: 18)
    @passenger_4 = Passenger.create(name: "Lisa Smith",
                                              age: 13)
    @passenger_5 = Passenger.create(name: "Joe Smith",
                                              age: 17)
    PassengerFlight.create(passenger_id: @passenger_1.id,
                          flight_id: @flight_1.id)
    PassengerFlight.create(passenger_id: @passenger_1.id,
                          flight_id: @flight_2.id)
    PassengerFlight.create(passenger_id: @passenger_2.id,
                          flight_id: @flight_1.id)
    PassengerFlight.create(passenger_id: @passenger_2.id,
                          flight_id: @flight_2.id)
    PassengerFlight.create(passenger_id: @passenger_2.id,
                          flight_id: @flight_3.id)
    PassengerFlight.create(passenger_id: @passenger_3.id,
                          flight_id: @flight_1.id)
    PassengerFlight.create(passenger_id: @passenger_3.id,
                          flight_id: @flight_2.id)
    PassengerFlight.create(passenger_id: @passenger_3.id,
                          flight_id: @flight_3.id)
    PassengerFlight.create(passenger_id: @passenger_3.id,
                          flight_id: @flight_4.id)
    PassengerFlight.create(passenger_id: @passenger_4.id,
                          flight_id: @flight_2.id)
    PassengerFlight.create(passenger_id: @passenger_5.id,
                          flight_id: @flight_1.id)
    PassengerFlight.create(passenger_id: @passenger_5.id,
                          flight_id: @flight_2.id)
  end
  
  it "When I visit the passengers index page, I see all passengers and their flights" do
    
    visit "/passengers"
    
    within ".passenger-#{@passenger_1.id}" do
      expect(page).to have_content(@passenger_1.name)
      expect(page).to have_content("Number of flights for this passenger: 2")
    end
    within ".passenger-#{@passenger_2.id}" do
      expect(page).to have_content(@passenger_2.name)
      expect(page).to have_content("Number of flights for this passenger: 3")
    end
    within ".passenger-#{@passenger_3.id}" do
      expect(page).to have_content(@passenger_3.name)
      expect(page).to have_content("Number of flights for this passenger: 4")
    end
    within ".passenger-#{@passenger_4.id}" do
      expect(page).to have_content(@passenger_4.name)
      expect(page).to have_content("Number of flights for this passenger: 1")
    end
    within ".passenger-#{@passenger_5.id}" do
      expect(page).to have_content(@passenger_5.name)
      expect(page).to have_content("Number of flights for this passenger: 2")
    end
    
  end
end
# User Story 4, Passengers Index Page
# As a visitor
# When I visit a passengers index page ('/passengers/:id')
# I see names of all passengers
# And next to the passengers name, I see the number of flights that the passenger has