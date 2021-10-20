# Write a method, max_inject(arr), that accepts any amount of numbers arguments and returns
# the largest number. Solve this using the built-in inject.

# @param [Array]
# @return [Integer]
def max_inject(*arr)
  arr.inject { |accumulator, current_value| accumulator > current_value ? accumulator : current_value }
end

p max_inject(1, -4, 0, 7, 5) # => 7
p max_inject(30, 28, 18)      # => 30
