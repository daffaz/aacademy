# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
  smallest = num_1 < num_2 ? num_1 : num_2
  (smallest..num_1 * num_2).each do |num|
    return num if (num % num_1).zero? && (num % num_2).zero?
  end
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
# @param [String] str
def most_frequent_bigram(str)
  hash = Hash.new(0)
  (0...str.length - 1).each_with_index do |_bigram, i|
    hash[str[i..i + 1]] += 1
  end
  hash.each_pair do |k, v|
    return k if v == hash.values.max
  end
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
  def inverse
    new_hash = {}
    self.each_pair do |k, v|
      new_hash[v] = k
    end
    new_hash
  end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
  def pair_sum_count(num)
    count = 0
    i = 0
    while i < self.length - 1
      j = i + 1
      while j < self.length
        count += 1 if self[i] + self[j] == num
        j += 1
      end
      i += 1
    end
    count
  end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
  def bubble_sort(&prc)

  end
end
