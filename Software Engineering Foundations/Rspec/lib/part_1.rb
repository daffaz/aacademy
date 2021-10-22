# @param num_1 [Integer]
# @param num_2 [Integer]
def average(num_1, num_2 = 0)
  (num_1 + num_2) / 2.0
end

# @param arr [Array]
def average_array(arr)
  result = arr.inject { |total, current| total + current }
  length = arr.length + 0.0
  result / length
end

# @param str [String]
# @param repeater [Integer]
def repeat(str, repeater)
  str * repeater
end

# @param str [String]
def yell(str)
  str.upcase! + '!'
end

# @param str [String]
def alternating_case(str)
  result = str.split.each_with_index do |word, i|
    if i.even?
      word.upcase!
    else
      word.downcase!
    end
  end
  result.join(' ')
end
