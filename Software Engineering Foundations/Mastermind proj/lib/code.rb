class Code
  POSSIBLE_PEGS = {
    'R' => :red,
    'G' => :green,
    'B' => :blue,
    'Y' => :yellow
  }.freeze

  attr_reader(:pegs)

  # @param [Array] arr
  def self.valid_pegs?(arr)
    arr.all? { |char| Code::POSSIBLE_PEGS.key?(char.upcase) }
  end

  # @param [Array] array
  def initialize(array)
    if Code.valid_pegs?(array)
      @pegs = array.join.upcase.split('')
    else
      raise 'Error, not valid pegs'
    end
  end

  # @param [Integer] length
  def self.random(length)
    arr = []
    length.times do
      arr << Code::POSSIBLE_PEGS.keys[2]
    end
    Code.new(arr)
  end

  # @param [String] pegs
  def self.from_string(pegs)
    Code.new(pegs.upcase.split(''))
  end

  # @param [Integer] index
  def [](index)
    pegs[index]
  end

  def length
    pegs.length
  end

  # @param [Code] code
  def num_exact_matches(code)
    count = 0
    pegs.each_with_index { |peg, i| count += 1 if code.pegs[i] == peg }
    count
  end

  # @param [Code] code
  # @return [Integer]
  def num_near_matches(code)
    count = 0
    temp = pegs
    code.pegs.each do |peg|
      next unless temp.include?(peg)

      count += 1
      temp.index(peg) == temp.length ? temp.pop : temp = [*temp[0...temp.index(peg)], *temp[temp.index(peg) + 1..-1]]
    end
    count - num_exact_matches(code)
  end

  # @param [Code] code
  def ==(code)
    pegs == code.pegs
  end
end
