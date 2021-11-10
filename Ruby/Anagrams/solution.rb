# @param [String] str1
# @param [String] str2

def first_anagram(_str1, str2)
  all_anagrams(str1).include?(str2)
end

def all_anagrams(str)
  return [str] if str.length <= 1

  prev_anagrams = all_anagrams(str[0...-1])
  new_anagrams = []

  prev_anagrams.each do |anagram|
    (0..anagram.length).each do |i|
      new_anagrams << anagram.dup.insert(i, str[-1])
    end
  end

  new_anagrams
end

# @param [String] str1
# @param [String] str2
def second_anagram(str1, str2)
  arr1 = str1.split('')
  arr2 = str2.split('')

  arr1.each do |char|
    target_idx = arr2.find_index(char)
    return false unless target_idx

    arr2.delete_at(target_idx)
  end

  arr2.empty?
end

def third_anagram(str1, str2)
  sorted = [str1, str2].map do |str|
    str.split('').sort.join
  end

  sorted.first == sorted.last
end

# p third_anagram('gizmo', 'sally')    #=> false
# p third_anagram('elvis', 'lives')    #=> true

def fourth_anagram(str1, str2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  str1.split('').each_index do |i|
    hash1[str1[i]] += 1
    hash2[str2[i]] += 1
  end

  hash1 == hash2
end

def fourth_anagram_one_hash(str1, str2)
  letter_sums = Hash.new(0)

  str1.each_char { |char| letter_sums[char] += 1 }
  str2.each_char { |char| letter_sums[char] -= 1 }

  letter_sums.each_value.all? { |sum| sum == 0 }
end

p fourth_anagram_one_hash('gizmo', 'sally')    #=> false
p fourth_anagram_one_hash('elvis', 'lives')    #=> true
