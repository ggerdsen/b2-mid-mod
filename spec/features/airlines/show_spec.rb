require 'rails_helper'

RSpec.describe "Airlines show page" do
  before :each do
    @airline_1 = Airline.create!(name: "Frontier")
    @airline_2 = Airline.create!(name: "Delta")
    @flight_1 = @airline_1.flights.create(number: 1234,
                                      date: "9/21/20",
                                      time: "09:00",
                                      departure_city: "Denver",
                                      arrival_city: "Helena")
    @flight_2 = @airline_2.flights.create(number: 4321,
                                      date: "09/23/20",
                                      time: "19:00",
                                      departure_city: "Helena",
                                      arrival_city: "Denver")
    @flight_3 = @airline_1.flights.create(number: 4321,
                                      date: "09/24/20",
                                      time: "04:00",
                                      departure_city: "Atlanta",
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
                          flight_id: @flight_3.id)
    PassengerFlight.create(passenger_id: @passenger_2.id,
                          flight_id: @flight_1.id)
    PassengerFlight.create(passenger_id: @passenger_3.id,
                          flight_id: @flight_1.id)
    PassengerFlight.create(passenger_id: @passenger_4.id,
                          flight_id: @flight_2.id)
    PassengerFlight.create(passenger_id: @passenger_5.id,
                          flight_id: @flight_2.id)
  end
  
  it "When I visit a airline show page, I see a unique list of passengers that have used this carrier" do
  
    visit "/airlines/#{@airline_1.id}"

    expect(page).to have_content("#{@passenger_1.name}")
    expect(page).to have_content("#{@passenger_2.name}")
    expect(page).to have_content("#{@passenger_3.name}")
    
    visit "/airlines/#{@airline_2.id}"
    
    expect(page).to have_content("#{@passenger_4.name}")
    expect(page).to have_content("#{@passenger_5.name}")
  end
end
