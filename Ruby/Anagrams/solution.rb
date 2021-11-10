# @param [String] str1
# @param [String] str2

def first_anagram(_str1, str2)
  result.include?(str2)
end

def all_anagrams(str)
  return [str] if str.length <= 1

  prev_anagrams = all_anagrams(str[0...-1])
  # "gizmo"
  # all(gizmo)
  # all(gizm)
  # all(giz) => prev = [ig, gi] => [zig, izg, igz, zgi, gzi, giz]
  # all(gi) => prev = [g] => [ig, gi]
  # all(g) => [g]
  new_anagrams = []

  prev_anagrams.each do |anagram|
    (0..anagram.length).each do |i|
      new_anagrams << anagram.dup.insert(i, str[-1])
    end
  end

  new_anagrams
end

p all_anagrams('g')
p all_anagrams('gi')
p all_anagrams('giz')
