# @param number [Integer]
def prime?(number)
  return false if number < 2

  (2...number).all? { |num| number % num != 0 }
end
