# @param [String] str
def duos(str)
  count = 0
  (0...str.length - 1).each { |i| count += 1 if str[i] == str[i + 1] }
  count
end

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

# @param [String] sentence
# @param [Hash] hash
def sentence_swap(sentence, hash)
  result = []
  sentence.split.each do |word|
    result << if !hash[word].nil?
                hash[word]
              else
                word
              end
  end
  result.join(' ')
end

# p sentence_swap('anything you can do I can do',
#                 'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
#   ) # 'nothing you shall drink I shall drink'
#
# p sentence_swap('what a sad ad',
#                 'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
#   ) # 'make a happy ad'
#
# p sentence_swap('keep coding okay',
#                 'coding'=>'running', 'kay'=>'pen'
#   ) # 'keep running okay'


# @param [Hash] hash
# @param [Proc] prc
# @param [Proc] blc
def hash_mapped(hash, prc, &blc)
  new_hash = {}
  hash.each_pair { |k, v| new_hash[blc.call(k)] = prc.call(v) }
  new_hash
end

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}
#
# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}

# @param [String] str
def counted_characters(str)
  hash = Hash.new(0)
  str.each_char { |char| hash[char] += 1 }
  hash.select { |_k, v| v > 2 }.keys
end

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []

# @param [String] str
def triplet_true?(str)
  str.each_char.with_index { |char, i| return true if str[i..i + 2] == char * 3 }
  false
end

# p triplet_true?('caaabb')        # true
# p triplet_true?('terrrrrible')   # true
# p triplet_true?('runninggg')     # true
# p triplet_true?('bootcamp')      # false
# p triplet_true?('e')             # false

# @param [String] str
# @param [Hash] hash
def energetic_encoding(str, hash)
  new_str = []
  str.split.each do |word|
    new_word = ''
    word.each_char do |char|
      new_word += if !hash[char].nil?
                    hash[char]
                  else
                    '?'
                  end
    end
    new_str << new_word
  end
  new_str.join(' ')
end

# p energetic_encoding('sent sea',
#                      'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
#   ) # 'zimp ziu'
#
# p energetic_encoding('cat',
#                      'a'=>'o', 'c'=>'k'
#   ) # 'ko?'
#
# p energetic_encoding('hello world',
#                      'o'=>'i', 'l'=>'r', 'e'=>'a'
#   ) # '?arri ?i?r?'
#
# p energetic_encoding('bike', {}) # '????'

def uncompress(str)
  new_str = ''
  i = 0
  while i < str.length
    new_str += str[i] * str[i + 1].to_i
    i += 2
  end
  new_str
end

# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzzz'

# @param [Array] arr
# @param [Array] prc
def conjunct_select(arr, *prcs)
  new_arr = []
  arr.each { |item| new_arr << item if prcs.all? { |prc| item if prc.call(item) } }
  new_arr
end

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }
#
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

def convert_pig_latin(str)
  new_str = []
  vowels = 'aiueo'
  str.split.each do |word|
    new_word = word
    if new_word.length < 3
      new_word
    elsif vowels.include?(new_word[0].downcase)
      new_word += 'yay'
    else
      temp_arr = ''
      original_word = word
      word = word.downcase
      until vowels.include?(word[0])
        temp_arr += word[0]
        word = word[1..-1]
      end
      word = word.capitalize if original_word.capitalize == original_word
      new_word = "#{word}#{temp_arr}ay"
    end
    new_str << new_word
  end
  new_str.join(' ')
end

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

# @param [String] word
def change_word(word)
  vowels = 'AIUEOaiueo'
  if vowels.include?(word[-1])
    word + word.downcase
  else
    i = word.length - 1
    while i >= 0
      return word + word[word.index(word[i])..-1] if vowels.include?(word[i])

      i -= 1
    end
  end
end

def reverberate(str)
  new_str = str.split.map { |word| word.length < 3 ? word : change_word(word) }

  new_str.join(' ')
end

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"ar

def disjunct_select(arr, *prcs)
  new_arr = []
  arr.each { |item| new_arr << item if prcs.any? { |prc| prc.call(item) } }

  new_arr
end

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }
#
# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#                   longer_four,
#                   ) # ["apple", "teeming"]
#
# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#                   longer_four,
#                   contains_o
#   ) # ["dog", "apple", "teeming", "boot"]
#
# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#                   longer_four,
#                   contains_o,
#                   starts_a
#   ) # ["ace", "dog", "apple", "teeming", "boot"]

def alternating_vowel(str)
  vowels = 'aiueo'
  new_str = []
  str.split.each_with_index do |word, i|
    new_word = word
    if i.odd?
      i = word.length - 1
      while i >= 0
        if vowels.include?(word[i])
          new_word = word[0...i] + word[i + 1..-1]
          break
        end
        i -= 1
      end
    else
      i = 0
      while i < word.length
        if vowels.include?(word[i])
          new_word = word[0...i] + word[i + 1..-1]
          break
        end
        i += 1
      end
    end
    new_str << new_word
  end

  new_str.join(' ')
end

# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

# @param [String] word
def silly_not_end_vowels(word)
  vowels = 'AIUEOaiueo'
  new_str = ''
  word.each_char do |char|
    new_str += if vowels.include?(char)
                 "#{char}b#{char.downcase}"
               else
                 char
               end
  end
  new_str
end

# @param [String] str
def silly_talk(str)
  result_str = []
  vowels = 'aiueo'
  str.split.each do |word|
    result_str << if vowels.include?(word[-1])
                    word + word[-1]
                  else
                    silly_not_end_vowels(word)
                  end
  end
  result_str.join(' ')
end

# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"


# @param [String] str
def compress(str)
  new_str = ''
  i = 0
  while i < str.length
    count = 1
    j = i + 1
    while str[i] == str[j]
      count += 1
      j += 1
    end
    new_str += if count == 1
                 str[i]
               else
                 str[i] + count.to_s
               end
    i += count
  end
  new_str
end

p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"