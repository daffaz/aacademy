# @param [Array] arr
# @return [Array]
require 'byebug'
def zip(*arr)
  result = []
  (0...arr[0].length).each do |i|
    j = 0
    pushed = []
    while j < arr.length
      pushed << arr[j][i]
      j += 1
    end
    result << pushed
  end
  result
end

# @param [Array] arr
# @param [Proc] prc1
# @param [Proc] prc2
def prizz_proc(arr, prc1, prc2)
  arr.select do |item|
    (prc1.call(item) || prc2.call(item)) && !(prc1.call(item) && prc2.call(item))
  end
end

# @param [Array] arr
def zany_zip(*arr)
  batas = arr.map(&:length).max
  (0...batas).map do |item|
    arr.map { |array| array[item] }
  end
end

def maximum(arr, &prc)
  max = 0
  return nil if arr.length.zero?

  temp = prc.call(arr[0])
  arr.each_with_index do |item, idx|
    if temp <= prc.call(item)
      temp = prc.call(item)
      max = idx
    end
  end
  arr[max]
end

def my_group_by(arr, &prc)
  hash = Hash.new { |h, k| h[k] = [] }
  arr.each do |item|
    hash[prc.call(item)] << item
  end
  hash
end

# @param [Array] arr
# @param [Proc] prc_tie_breaker
# @param [Proc] prc_blocks
def max_tie_breaker(arr, prc_tie_breaker, &prc_blocks)
  return nil if arr.empty?

  max = arr.first
  arr.each do |item|
    if prc_blocks.call(item) > prc_blocks.call(max)
      max = item
    elsif prc_blocks.call(item) == prc_blocks.call(max) && prc_tie_breaker.call(item) > prc_blocks.call(item)
      max = item
    end
  end
  max
end

def change_word(word)
  indices = vowel_indices(word)
  word[indices.first..indices.last]
end

def vowel_indices(word)
  vowels = 'aeiou'
  indices = []
  word.each_char.with_index do |char, i|
    indices << i if vowels.include?(char)
  end
  indices
end

def silly_syllables(sentence)
  words = sentence.split(' ')
  new_words = words.map do |word|
    num_vowels = vowel_indices(word).length
    if num_vowels < 2
      word
    else
      change_word(word)
    end
  end
  new_words.join(' ')
end