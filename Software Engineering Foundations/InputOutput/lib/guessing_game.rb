class GuessingGame
  # @param [Integer] min
  # @param [Integer] max
  def initialize(min, max)
    @min = min
    @max = max
    @secret_num = rand(@min..@max)
    @num_attempts = 0
    @game_over = false
  end

  # getter
  def num_attempts
    @num_attempts
  end

  # getter
  def game_over?
    @game_over
  end

  # getter
  def secret_number
    @secret_num
  end

  # @param [Integer] num
  def check_num(num)
    @num_attempts += 1
    if num == secret_number
      @game_over = true
      p "you win"
    elsif num > secret_number
      p "too big"
    else
      p "too small"
    end
  end

  def ask_user
    p "enter a number"
    input = gets.chomp.to_i
    check_num(input)
  end
end
