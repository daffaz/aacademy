# @param [Array] arr
def my_reject(arr, &prc)
  result = []
  arr.each { |item| result << item unless prc.call(item) }
  result
end

def my_one?(arr, &prc)
  result = []
  arr.each do |item|
    result << item if prc.call(item)
  end
  return false if result.length > 1 || result.length.zero?
  true
end

# @param [Hash] hash
# @param [Proc] prc
def hash_select(hash, &prc)
  hash_res = {}
  hash.each_pair do |k, v|
    hash_res[k] = v if prc.call(k, v)
  end
  hash_res
end

# @param [Array] arr
# @param [Proc] prc1
# @param [Proc] prc2
def xor_select(arr, prc1, prc2)
  arr.select do |item|
    (prc1.call(item) || prc2.call(item)) && !(prc1.call(item) && prc2.call(item))
  end
end

# @param [Object] val
# @param [Array] arr_proc
def proc_count(val, arr_proc)
  count = 0
  arr_proc.each do |prc|
    count += 1 if prc.call(val)
  end
  count
end