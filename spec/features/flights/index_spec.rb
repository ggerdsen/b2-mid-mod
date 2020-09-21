require 'rails_helper'

RSpec.describe "Flights index page" do
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
    PassengerFlight.create(passenger_id: @passenger_2.id,
                          flight_id: @flight_1.id)
    PassengerFlight.create(passenger_id: @passenger_3.id,
                          flight_id: @flight_1.id)
    PassengerFlight.create(passenger_id: @passenger_4.id,
                          flight_id: @flight_2.id)
    PassengerFlight.create(passenger_id: @passenger_5.id,
                          flight_id: @flight_2.id)
  end
  
  it "When I visit a flight index page, I see all flight numbers and passengers" do
  
    visit "/flights"
    
    expect(page).to have_content("#{@flight_1.number}")
    expect(page).to have_content("#{@flight_2.number}")
    expect(page).to have_content("#{@passenger_1.name}")
    expect(page).to have_content("#{@passenger_2.name}")
    expect(page).to have_content("#{@passenger_3.name}")
    expect(page).to have_content("#{@passenger_4.name}")
    expect(page).to have_content("#{@passenger_5.name}")
  end
  
  it "When I visit a flight index page, I see all flight numbers and passengers" do
  
    visit "/flights"
    
    expect(page).to have_content("#{@passenger_1.name}")
    expect(page).to have_content("#{@passenger_2.name}")
    expect(page).to have_content("#{@passenger_3.name}")
    expect(page).to have_content("#{@passenger_4.name}")
    expect(page).to have_content("#{@passenger_5.name}")
    
    expect(page).to have_link("Remove From Flight")

    click_link("Remove From Flight", match: :first)
    
    expect(current_path).to eq("/flights")

    expect(page).to_not have_content("#{@passenger_1.name}")
    expect(page).to have_content("#{@passenger_2.name}")
    expect(page).to have_content("#{@passenger_3.name}")
    expect(page).to have_content("#{@passenger_4.name}")
    expect(page).to have_content("#{@passenger_5.name}")
    
    click_link("Remove From Flight", match: :first)
    
    expect(current_path).to eq("/flights")
    
    expect(page).to_not have_content("#{@passenger_1.name}")
    expect(page).to_not have_content("#{@passenger_2.name}")
    expect(page).to have_content("#{@passenger_3.name}")
    expect(page).to have_content("#{@passenger_4.name}")
    expect(page).to have_content("#{@passenger_5.name}")
  end
  
  # User Story 3, Remove a Passenger from a Flight
  # As a visitor
  # When I visit the flights index page
  # Next to each passengers name
  # I see a link to remove that passenger from that flight
  # When I click on that link
  # I'm returned to the flights index page
  # And I no longer see that passenger listed under that flight
end
