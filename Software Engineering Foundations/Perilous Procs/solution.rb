# @param [Array] arr
# @param [Proc] prc
def some?(arr, &prc)
  arr.each { |item| return true if prc.call(item) }
  false
end

# p some?([3, 1, 11, 5]) { |n| n.even? }                                # false
# p some?([3, 4, 11, 5]) { |n| n.even? }                                # true
# p some?([8, 2]) { |n| n.even? }                                       # true
# p some?(['squash', 'corn', 'kale', 'carrot']) { |str| str[0] == 'p' } # false
# p some?(['squash', 'corn', 'kale', 'potato']) { |str| str[0] == 'p' } # true
# p some?(['parsnip', 'lettuce', 'pea']) { |str| str[0] == 'p' }        # true

# @param [Array] arr
# @param [Proc] prc
# @param [Integer] number
def exactly?(arr, number, &prc)
  count = 0
  arr.each { |item| count += 1 if prc.call(item) }
  count == number
end

# p exactly?(['A', 'b', 'C'], 2) { |el| el == el.upcase }         # true
# p exactly?(['A', 'B', 'C'], 2) { |el| el == el.upcase }         # false
# p exactly?(['A', 'B', 'C'], 3) { |el| el == el.upcase }         # true
# p exactly?(['cat', 'DOG', 'bird'], 1) { |el| el == el.upcase }  # true
# p exactly?(['cat', 'DOG', 'bird'], 0) { |el| el == el.upcase }  # false
# p exactly?(['cat', 'dog', 'bird'], 0) { |el| el == el.upcase }  # true
# p exactly?([4, 5], 3) { |n| n > 0 }                             # false
# p exactly?([4, 5, 2], 3) { |n| n > 0 }                          # true
# p exactly?([42, -9, 7, -3, -6], 2) { |n| n > 0 }                # true


# @param [Array] arr
# @param [Proc] prc
def filter_out(arr, &prc)
  filtered = []
  arr.each { |item| filtered << item unless prc.call(item) }
  filtered
end

# p filter_out([10, 6, 3, 2, 5 ]) { |x| x.odd? }      # [10, 6, 2]
# p filter_out([1, 7, 3, 5 ]) { |x| x.odd? }          # []
# p filter_out([10, 6, 3, 2, 5 ]) { |x| x.even? }     # [3, 5]
# p filter_out([1, 7, 3, 5 ]) { |x| x.even? }         # [1, 7, 3, 5]


# @param [Array] arr
# @param [Proc] prc
# @param [Integer] number
def at_least?(arr, number, &prc)
  count = 0
  arr.each do |item|
    count += 1 if prc.call(item)
  end
  count >= number
end

# p at_least?(['sad', 'quick', 'timid', 'final'], 2) { |s| s.end_with?('ly') }
# # false
# p at_least?(['sad', 'quickly', 'timid', 'final'], 2) { |s| s.end_with?('ly') }
# # false
# p at_least?(['sad', 'quickly', 'timidly', 'final'], 2) { |s| s.end_with?('ly') }
# # true
# p at_least?(['sad', 'quickly', 'timidly', 'finally'], 2) { |s| s.end_with?('ly') }
# # true
# p at_least?(['sad', 'quickly', 'timid', 'final'], 1) { |s| s.end_with?('ly') }
# # true
# p at_least?(['sad', 'quick', 'timid', 'final'], 1) { |s| s.end_with?('ly') }
# # false
# p at_least?([false, false, false], 3) { |bool| bool }
# # false
# p at_least?([false, true, true], 3) { |bool| bool }
# # false
# p at_least?([true, true, true], 3) { |bool| bool }
# # true
# p at_least?([true, true, true, true], 3) { |bool| bool }
# # true

def every?(arr, &prc)
  arr.each { |item| return false unless prc.call(item) }
  true
end

# p every?([3, 1, 11, 5]) { |n| n.even? }                                 # false
# p every?([2, 4, 4, 8]) { |n| n.even? }                                  # true
# p every?([8, 2]) { |n| n.even? }                                        # true
# p every?(['squash', 'corn', 'kale', 'carrot']) { |str| str[0] == 'p' }  # false
# p every?(['squash', 'pea', 'kale', 'potato']) { |str| str[0] == 'p' }   # false
# p every?(['parsnip', 'potato', 'pea']) { |str| str[0] == 'p' }          # true


def at_most?(arr, number, &prc)
  count = 0
  arr.each { |item| count += 1 if prc.call(item) }
  number >= count
end

# p at_most?([-4, 100, -3], 1) { |el| el > 0 }                         # true
# p at_most?([-4, -100, -3], 1) { |el| el > 0 }                        # true
# p at_most?([4, 100, -3], 1) { |el| el > 0 }                          # false
# p at_most?([4, 100, 3], 1) { |el| el > 0 }                           # false
# p at_most?(['r', 'q', 'e', 'z'], 2) { |el| 'aeiou'.include?(el) }    # true
# p at_most?(['r', 'i', 'e', 'z'], 2) { |el| 'aeiou'.include?(el) }    # true
# p at_most?(['r', 'i', 'e', 'o'], 2) { |el| 'aeiou'.include?(el) }    # false

def first_index(arr, &prc)
  arr.each { |item| return arr.index(item) if prc.call(item) }
  nil
end

# p first_index(['bit', 'cat', 'byte', 'below']) { |el| el.length > 3 }           # 2
# p first_index(['bitten', 'bit', 'cat', 'byte', 'below']) { |el| el.length > 3 } # 0
# p first_index(['bitten', 'bit', 'cat', 'byte', 'below']) { |el| el.length > 6 } # nil
# p first_index(['bit', 'cat', 'byte', 'below']) { |el| el[0] == 'b' }            # 0
# p first_index(['bit', 'cat', 'byte', 'below']) { |el| el.include?('a') }        # 1
# p first_index(['bit', 'cat', 'byte', 'below']) { |el| el[0] == 't' }            # nil

# @param [Array] arr
# @param [Proc] prc1
# @param [Proc] prc2
def xnor_select(arr, prc1, prc2)
  arr.select { |item| prc1.call(item) && prc2.call(item) || !(prc1.call(item) || prc2.call(item)) }
  # arr.select { |item| prc1.call(item) == prc2.call(item) }
end

# is_even = Proc.new { |n| n % 2 == 0 }
# is_odd = Proc.new { |n| n % 2 != 0 }
# is_positive = Proc.new { |n| n > 0 }
# p xnor_select([8, 3, -4, -5], is_even, is_positive)         # [8, -5]
# p xnor_select([-7, -13, 12, 5, -10], is_even, is_positive)  # [-7, -13, 12]
# p xnor_select([-7, -13, 12, 5, -10], is_odd, is_positive)   # [5, -10]

# @param [Array] arr
# @param [Proc] prc
def filter_out!(arr, &prc)
  arr.each { |item| arr.delete(item) if prc.call(item) }
end

# arr_1 = [10, 6, 3, 2, 5 ]
# p arr_1.object_id
# filter_out!(arr_1) { |x| x.odd? }
# p arr_1     # [10, 6, 2]
# p arr_1.object_id
#
# arr_2 = [1, 7, 3, 5 ]
# filter_out!(arr_2) { |x| x.odd? }
# p arr_2     # []
#
# arr_3 = [10, 6, 3, 2, 5 ]
# filter_out!(arr_3) { |x| x.even? }
# p arr_3     # [3, 5]
#
# arr_4 = [1, 7, 3, 5 ]
# filter_out!([1, 7, 3, 5 ]) { |x| x.even? }
# p arr_4 # [1, 7, 3, 5]


def multi_map(arr, num = 1, &prc)
  result = []
  arr.each do |item|
    num.times { item = prc.call(item) }
    result << item
  end
  result
end

# p multi_map(['pretty', 'cool', 'huh?']) { |s| s + '!'}      # ["pretty!", "cool!", "huh?!"]
# p multi_map(['pretty', 'cool', 'huh?'], 1) { |s| s + '!'}   # ["pretty!", "cool!", "huh?!"]
# p multi_map(['pretty', 'cool', 'huh?'], 3) { |s| s + '!'}   # ["pretty!!!", "cool!!!", "huh?!!!"]
# p multi_map([4, 3, 2, 7], 1) { |num| num * 10 }             # [40, 30, 20, 70]
# p multi_map([4, 3, 2, 7], 2) { |num| num * 10 }             # [400, 300, 200, 700]
# p multi_map([4, 3, 2, 7], 4) { |num| num * 10 }             #

def proctition(arr, &prc)
  trues = []
  falses = []
  arr.each do |item|
    trues << item if prc.call(item)
    falses << item unless prc.call(item)
  end
  [*trues, *falses]
end

# p proctition([4, -5, 7, -10, -2, 1, 3]) { |el| el > 0 }
# # [4, 7, 1, 3, -5, -10, -2]
#
# p proctition([7, 8, 3, 6, 10]) { |el| el.even? }
# # [8, 6, 10, 7, 3]
#
# p proctition(['cat','boot', 'dog', 'bug', 'boat']) { |s| s[0] == 'b' }
# # ["boot", "bug", "boat", "cat", "dog"]

def selected_map!(arr, prc1, prc2)
  arr.each_with_index { |item, idx| arr[idx] = prc2.call(item) if prc1.call(item) }
  nil
end

# is_even = Proc.new { |n| n.even? }
# is_positive = Proc.new { |n| n > 0 }
# square = Proc.new { |n| n * n }
# flip_sign = Proc.new { |n| -n }
#
# arr_1 = [8, 5, 10, 4]
# p selected_map!(arr_1, is_even, square)     # nil
# p arr_1                                     # [64, 5, 100, 16]
#
# arr_2 = [-10, 4, 7, 6, -2, -9]
# p selected_map!(arr_2, is_even, flip_sign)  # nil
# p arr_2                                     # [10, -4, 7, -6, 2, -9]
#
# arr_3 = [-10, 4, 7, 6, -2, -9]
# p selected_map!(arr_3, is_positive, square) # nil
# p arr_3                                     # [-10, 16, 49, 36, -2, -9]

# @param [Object] val
# @param [Array<Proc>] arr
def chain_map(val, arr)
  # arr.each { |prc| val = prc.call(val) }
  # val
  arr.inject(val) { |prc_total, curr_prc | curr_prc.call(prc_total) }
end

# add_5 = Proc.new { |n| n + 5 }
# half = Proc.new { |n| n / 2.0 }
# square = Proc.new { |n| n * n }
#
# p chain_map(25, [add_5, half])          # 15.0
# p chain_map(25, [half, add_5])          # 17.5
# p chain_map(25, [add_5, half, square])  # 225
# p chain_map(4, [square, half])          # 8
# p chain_map(4, [half, square])          # 4


# @param [String] str
# @param [Hash] hash
def proc_suffix(str, hash)
  result = []
  str.split.each do |word|
    new_word = word
    hash.each_pair { |k, v| new_word += v if k.call(word) }
    result << new_word
  end
  result.join(' ')
end

# contains_a = Proc.new { |w| w.include?('a') }
# three_letters = Proc.new { |w| w.length == 3 }
# four_letters = Proc.new { |w| w.length == 4 }
#
# p proc_suffix('dog cat',
#               contains_a => 'ly',
#               three_letters => 'o'
#   )   # "dogo catlyo"
#
# p proc_suffix('dog cat',
#               three_letters => 'o',
#               contains_a => 'ly'
#   )   # "dogo catoly"
#
# p proc_suffix('wrong glad cat',
#               contains_a => 'ly',
#               three_letters => 'o',
#               four_letters => 'ing'
#   )   # "wrong gladlying catlyo"
#
# p proc_suffix('food glad rant dog cat',
#               four_letters => 'ing',
#               contains_a => 'ly',
#               three_letters => 'o'
#   )   # "fooding gladingly rantingly dogo catlyo"

def proctition_platinum(arr, *proc)
  hash = {}
  proc.each_index { |i| hash[i + 1] = [] }

  arr.each do |item|
    proc.each_with_index do |prc, idx|
      if prc.call(item)
        hash[idx + 1] << item
        break
      end
    end
  end
  hash
end

# is_yelled = Proc.new { |s| s[-1] == '!' }
# is_upcase = Proc.new { |s| s.upcase == s }
# contains_a = Proc.new { |s| s.downcase.include?('a') }
# begins_w = Proc.new { |s| s.downcase[0] == 'w' }
#
# p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_yelled, contains_a)
# # {1=>["when!", "WHERE!"], 2=>["what"]}
#
# p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_yelled, is_upcase, contains_a)
# # {1=>["when!", "WHERE!"], 2=>["WHO", "WHY"], 3=>["what"]}
#
# p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_upcase, is_yelled, contains_a)
# # {1=>["WHO", "WHERE!", "WHY"], 2=>["when!"], 3=>["what"]}
#
# p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], begins_w, is_upcase, is_yelled, contains_a)
# # {1=>["WHO", "what", "when!", "WHERE!", "WHY"], 2=>[], 3=>[], 4=>[]}


# @param [String] str
# @param [Hash] hash
def procipher(str, hash)
  res = []
  str.split.each do |item|
    new_word = item
    hash.each_pair { |k, v| new_word = v.call(new_word) if k.call(item) }
    res << new_word
  end
  res.join(' ')
end

# is_yelled = Proc.new { |s| s[-1] == '!' }
# is_upcase = Proc.new { |s| s.upcase == s }
# contains_a = Proc.new { |s| s.downcase.include?('a') }
# make_question = Proc.new { |s| s + '???' }
# reverse = Proc.new { |s| s.reverse }
# add_smile = Proc.new { |s| s + ':)' }
#
# p procipher('he said what!',
#             is_yelled => make_question,
#             contains_a => reverse
#   ) # "he dias ???!tahw"
#
# p procipher('he said what!',
#             contains_a => reverse,
#             is_yelled => make_question
#   ) # "he dias !tahw???"
#
# p procipher('he said what!',
#             contains_a => reverse,
#             is_yelled => add_smile
#   ) # "he dias !tahw:)"
#
# p procipher('stop that taxi now',
#             is_upcase => add_smile,
#             is_yelled => reverse,
#             contains_a => make_question
#   ) # "stop that??? taxi??? now"
#
# p procipher('STOP that taxi now!',
#             is_upcase => add_smile,
#             is_yelled => reverse,
#             contains_a => make_question
#   ) # "STOP:) that??? taxi??? !won"


def picky_procipher(str, hash)
  res = []
  str.split.each do |item|
    new_word = item
    hash.each_pair do |k, v|
      if k.call(item)
        new_word = v.call(item)
        break
      end
    end
    res << new_word
  end
  res.join(' ')
end

is_yelled = Proc.new { |s| s[-1] == '!' }
is_upcase = Proc.new { |s| s.upcase == s }
contains_a = Proc.new { |s| s.downcase.include?('a') }
make_question = Proc.new { |s| s + '???' }
reverse = Proc.new { |s| s.reverse }
add_smile = Proc.new { |s| s + ':)' }

p picky_procipher('he said what!',
                  is_yelled => make_question,
                  contains_a => reverse
  ) # "he dias what!???"

p picky_procipher('he said what!',
                  contains_a => reverse,
                  is_yelled => make_question
  ) # "he dias !tahw"

p picky_procipher('he said what!',
                  contains_a => reverse,
                  is_yelled => add_smile
  ) # "he dias !tahw"

p picky_procipher('stop that taxi now',
                  is_upcase => add_smile,
                  is_yelled => reverse,
                  contains_a => make_question
  ) # "stop that??? taxi??? now"

p picky_procipher('STOP that taxi!',
                  is_upcase => add_smile,
                  is_yelled => reverse,
                  contains_a => make_question
  ) # "STOP:) that??? !ixat"