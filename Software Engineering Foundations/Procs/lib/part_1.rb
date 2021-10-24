# @param [Array] arr
# @param [Proc] proc
def my_map(arr, &prc)
  result = []
  arr.each { |sub_arr| result << prc.call(sub_arr) }
  result
end

# @param [Array] arr
# @param [Proc] proc
def my_select(arr, &prc)
  result = []
  arr.each { |sub_arr| result << sub_arr if prc.call(sub_arr) }
  result
end

# @param [Proc] prc
# @param [Array] arr
def my_count(arr, &prc)
  result = []
  arr.each { |sub_arr| result << sub_arr if prc.call(sub_arr) }
  result.length
end

# @param [Proc] proc
# @param [Array] arr
def my_any?(arr, &proc)
  result = []
  arr.each { |sub_arr| result << sub_arr if proc.call(sub_arr) }
  result.length > 0
end

# @param [Proc] proc
# @param [Array] arr
def my_all?(arr, &proc)
  arr.each { |sub_arr| return false unless proc.call(sub_arr) }
  true
end

# @param [Proc] proc
# @param [Array] arr
def my_none?(arr, &proc)
  arr.each { |sub_arr| return false if proc.call(sub_arr) }
  true
end