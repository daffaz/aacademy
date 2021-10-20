# Write a method, union, that accepts any number of arrays as arguments.
# The method should return an array containing all elements of the given arrays.

# @return [Array]
# @param arr [Array]
def union(*arr)
  arr.flatten!
end

p union(%w[a b], [1, 2, 3]) # => ["a", "b", 1, 2, 3]
p union(%w[x y], [true, false], [20, 21, 23]) # => ["x", "y", true, false, 20, 21, 23]
