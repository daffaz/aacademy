# brute force
def bad_two_sum(arr, target)
  i = 0
  while i < arr.length
    j = i + 1
    while j < arr.length
      return true if arr[i] + arr[j] == target

      j += 1
    end
    i += 1
  end
  false
end

# @param [Array] arr
# @param [Integer] target
def okay_two_sum(arr, target)
  sorted = arr.sort
  i = 0
  j = arr.length - 1

  while i < j
    case arr[i] + arr[j] <=> target
    when 0
      return true
    when -1
      i += 1
    when 1
      j -= 1
    end
  end
  false
end

arr = [0, 1, 5, 7]
# sorted = [0, 1, 5, 7]
p okay_two_sum(arr, 6)
p okay_two_sum(arr, 10)
