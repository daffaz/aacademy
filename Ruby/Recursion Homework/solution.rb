def sum_to(n)
  return nil if n < 1
  return 1 if n == 1

  n + sum_to(n - 1)
end

# @param [Array] arr
def add_numbers(arr)
  return arr.first if arr.length <= 1

  arr.first + add_numbers(arr.drop(1))
end

def gamma_function(n)
  return 1 if n == 1
  return nil if n <= 0

  (n - 1) * gamma_function(n - 1)
end

# @param [Array] flavors_arr
# @param [String] title
def ice_cream_shop(flavors_arr, fav)
  return false if flavors_arr.empty?
  return true if flavors_arr.first == fav

  ice_cream_shop(flavors_arr.drop(1), fav)
end

# @param [String] str
def reverse(str)
  return str if str.length <= 1

  reverse(str[1..-1]) + str[0]
end