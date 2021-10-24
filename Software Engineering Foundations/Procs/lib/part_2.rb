# @param [String] str
# @param [Proc] proc
def reverser(str, &proc)
  str = str.reverse!
  proc.call(str)
end

# @param [String] str
# @param [Proc] proc
def word_changer(str, &proc)
  str.split.map { |word| proc.call(word) }.join(" ")
end

# @param [Integer] num
# @param [Proc] proc1
# @param [Proc] proc2
def greater_proc_value(num, proc1, proc2)
  if proc1.call(num) > proc2.call(num)
    return proc1.call(num)
  end
  proc2.call(num)
end

# @param [Array] arr
# @param [Proc] proc1
# @param [Proc] proc2
def and_selector(arr, proc1, proc2)
  result = []
  arr.each { |num| result << num if proc1.call(num) && proc2.call(num) }
  result
end

# @param [Array] arr
# @param [Proc] proc1
# @param [Proc] proc2
def alternating_mapper(arr, proc1, proc2)
  result = []
  
  arr.each_with_index do |num, i|
    if i.even?
      result << proc1.call(num)
    else
      result << proc2.call(num)
    end
  end
  result
end