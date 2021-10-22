# @param arr [Array]
# @param num [Integer]
def partition(arr, num)
  resArr = Array.new(2) { Array.new([]) }
  arr.each do |item|
    if item >= num
      resArr[1].push(item)
    else
      resArr[0].push(item)
    end
  end

  resArr
end

# @param hash_1 [Hash]
# @param hash_2 [Hash]
def merge(hash_1, hash_2)
  { **hash_1, **hash_2 }
end

# @param string [String]
# @param array [Array]
def censor(string, array)
  vowels = 'aiueoAIUEO'

  string = string.split.map do |word|
    if !array.index(word.downcase).nil?
      word.each_char.with_index do |char, i|
        word[i] = '*' if vowels.include?(char)
      end
    else
      word
    end
  end.join(' ')
end

# @param num [Integer]
def power_of_two?(num)
  while num != 0
    num /= 2
    return false if num.odd? && num != 1
  end
  true
end
