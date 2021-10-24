# @param [Array] arr
def select_even_nums(arr)
  arr.select(&:even?)
end

# @param [Array] arr
# @return [Array]
def reject_puppies(arr)
  arr.reject { |hash| hash['age'] <= 2 }
end

# @param [Array] arr
# @return [Integer]
def count_positive_subarrays(arr)
  arr.count { |sub_arr| sub_arr.sum.positive? }
end

# @param [String] str
def aba_translate(str)
  vowels = 'aiueo'
  result = ''
  str.each_char do |char|
    result += if vowels.include?(char)
                "#{char}b#{char}"
              else
                char
              end
  end
  result
end

# @param [Array] arr
def aba_array(arr)
  arr.map { |word| aba_translate(word) }
end
