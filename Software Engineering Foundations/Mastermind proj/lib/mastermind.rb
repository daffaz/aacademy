require_relative 'code'

class Mastermind
  attr_reader(:secret_code)

  # @param [Integer] length
  def initialize(length)
    @secret_code = Code.random(length)
  end

  # @param [Code] code
  def print_matches(code)
    p "Exact matches: #{code.num_exact_matches(secret_code)}"
    p "Near matches: #{code.num_near_matches(secret_code)}"
  end

  def ask_user_for_guess
    p 'Enter a code'
    input = gets.chomp
    code = Code.from_string(input)
    p print_matches(code)
    code.pegs == secret_code.pegs
  end
end
