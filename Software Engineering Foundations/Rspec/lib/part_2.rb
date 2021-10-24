# @param string [String]
def hipsterfy(string)
  i = string.length - 1
  while i >= 0
    if 'aiueo'.include?(string[i])
      string[i] = ''
      break
    elsif i == string.length / 2
      break
    end
    i -= 1
  end
  string
end

# @param string [String]
def vowel_counts(string)
  hash = Hash.new(0)
  string.downcase!
  string = string.split.join

  string.each_char { |char| hash[char] += 1 if 'aiueo'.include?(char) }
  hash
end

# @param str [String]
# @param num [Integer]
def caesar_cipher(str, num)
  result = str
  result.each_char.with_index do |char, i|
    return str if str[0].ord < 97 || str[0].ord > 122

    result[i] = if char.ord < 97 || char.ord > 122
                  char
                elsif (char.ord + (num % 26)) > 122
                  (96 + (char.ord + num - 122)).chr
                else
                  (char.ord + (num % 26)).chr
                end
  end
  result
end
