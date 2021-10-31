require 'passenger'
class Flight
  attr_reader :passengers

  def initialize(fligt_num, cap)
    @flight_number = fligt_num
    @capacity = cap
    @passengers = []
  end

  def full?
    @passengers.length >= @capacity
  end

  # @param [Passenger] passenger
  def board_passenger(passenger)
    if !full? && passenger.has_flight?(@flight_number)
      @passengers << passenger
    end
  end

  def list_passengers
    @passengers.map(&:name)
  end

  def [](index)
    @passengers[index]
  end

  # @param [Passenger] passenger
  def <<(passenger)
    board_passenger(passenger)
  end
end