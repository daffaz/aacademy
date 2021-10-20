# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

# @return [String]
# @param str [String]
def compress_str(str)
  result = ''
  angka = 1

  i = 0
  while i < str.length
    j = i
    while str[j] == str[j + 1]
      angka += 1
      j += 1
    end
    result += if angka == 1
                str[i]
              else
                angka.to_s + str[i]

              end
    i += angka
    angka = 1
  end
  result
end

p compress_str('aaabbc')        # => "3a2bc"
p compress_str('xxyyyyzz')      # => "2x4y2z"
p compress_str('qqqqq')         # => "5q"
p compress_str('mississippi')   # => "mi2si2si2pi"
