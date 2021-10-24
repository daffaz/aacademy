# @param string [String]
def palindrome?(string)
  reversed = ''
  i = string.length - 1
  while i >= 0
    reversed += string[i]
    i -= 1
  end

  string == reversed
end

# @param string [String]
def substrings(string)
  result = []
  i = 0
  while i < string.length
    j = i
    while j < string.length
      result.push(string[i..j])
      j += 1
    end
    i += 1
  end
  result
end

# @param string [String]
def palindrome_substrings(string)
  result = []
  result << string if palindrome?(string)
  result = [*substrings(string)] if string.length == 2

  string.each_char.with_index do |char, i|
    if i + 2 < string.length - 1 && palindrome?(char + string[i + 1] + string[i + 2])
      result << char + string[i + 1] + string[i + 2]
    end
  end
  result
end
