# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

def coprime?(_num_1, _num_2)
  prime_checker = []

  panjang = if _num_2 > _num_1
              _num_2
            else
              _num_1
            end

  (2...panjang).each { |num| prime_checker << num if _num_1 % num == 0 && _num_2 % num == 0 }

  prime_checker.length <= 0
end

p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false
