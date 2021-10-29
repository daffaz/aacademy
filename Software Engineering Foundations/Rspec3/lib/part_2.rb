def element_count(arr)
  hash = Hash.new(0)
  arr.each { |item| hash[item] += 1 }
  hash
end

# @param [String] str
# @param [Hash] hash
def char_replace!(str, hash)
  (0...str.length).each do |i|
    str[i] = hash[str[i]] unless hash[str[i]].nil?
  end
  str
end

# @param [Array] arr
def product_inject(arr)
  arr.inject(1) { |total, current_number | total * current_number}
end