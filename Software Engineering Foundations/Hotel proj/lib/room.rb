class Room
  attr_reader :capacity, :occupants

  def initialize(capacity)
    @capacity = capacity
    @occupants = []
  end

  def full?
    occupants.length >= capacity
  end

  def available_space
    capacity - occupants.length
  end

  # @param [String] person
  def add_occupant(person)
    if full?
      false
    else
      occupants.push(person)
      true
    end
  end
end
