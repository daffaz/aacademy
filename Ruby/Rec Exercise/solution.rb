def range(min, max)
  return [] if max <= min

  range(min, max - 1) + [max - 1]
end

def exp1(b, n)
  return 1 if n <= 0

  b * exp1(b, n - 1)
end

# @param [Integer] b
# @param [Integer] n
def exp2(b, n)
  return 1 if n <= 0
  return b if n == 1

  if n.even?
    exp2(b, n / 2)**2
  else
    b * (exp2(b, (n - 1) / 2)**2)
  end
end

class Array
  def deep_dup
    new_arr = []
    self.each do |item|
      new_arr << if item.is_a?(Array)
                   self.deep_dup
                 else
                   item
                 end
    end
    new_arr
  end
end

def iter_fibo(n)
  return [] if n <= 0
  return [0] if n == 1

  fibo = [0, 1]

  while fibo.length < n
    fibo << fibo[-2] + fibo[-1]
  end
  fibo
end

def recur_fibo(n)
  if n <= 2
    [0, 1].take(n)
  else
    fibs = recur_fibo(n - 1)
    fibs << fibs[-2] + fibs[-1]
  end
end

# @param [Array] arr
# @param [Integer] key
def bsearch(arr, key)
  return nil if arr.empty?

  middle = arr.length / 2
  case key <=> arr[middle]
  when -1
    bsearch(arr[0...middle], key)
  when 0
    middle
  when 1
    bsearch(arr[(middle + 1)..-1], key)
  end
end