require_relative 'room'

class Hotel
  # @param [String] name
  # @param [Hash] hash
  def initialize(name, hash)
    @name = name
    @rooms = {}
    hash.each_pair do |key, value|
      @rooms[key] = Room.new(value)
    end
  end

  def name
    @name.split.map(&:capitalize).join(' ')
  end

  attr_reader :rooms

  # @param [String] room_name
  def room_exists?(room_name)
    !rooms[room_name].nil?
  end

  # @param [String] person
  # @param [String] room_name
  def check_in(person, room_name)
    if room_exists?(room_name)
      if rooms[room_name].add_occupant(person)
        p 'check in successful'
      else
        p 'sorry, room is full'
      end
    else
      p 'sorry, room does not exist'
    end
  end

  # @return [Boolean]
  def has_vacancy?
    rooms.each_key do |room|
      return true unless rooms[room].full?
    end
    false
  end

  def list_rooms
    rooms.each_pair do |room_name, room_object|
      print "#{room_name}.*#{room_object.available_space}\n"
    end
  end
end
