# Reimplement the bubble sort outlined in the preceding lecture.
# The bubble_sort method should accept an array of numbers and arrange the elements in increasing order.
# The method should return the array.
# Do not use the built-in Array#sort

# @return [Array]
# @param arr [Array]
def bubble_sort(arr)
  swap = true

  batas = arr.length
  while swap
    i = 0
    swap_count = 0
    while i < batas
      break if i + 1 > arr.length - 1

      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        swap_count += 1
      end
      i += 1
    end
    batas -= 1
    swap = false if swap_count == 0
  end

  arr
end

p bubble_sort([2, 8, 5, 2, 6])      # => [2, 2, 5, 6, 8]
p bubble_sort([10, 8, 7, 1, 2, 3])  # => [1, 2, 3, 7, 8, 10]

# [2, 8, 5, 2, 6]
# [2, 5, 8, 2, 6]
# [2, 5, 2, 8, 6]
# [2, 5, 2, 6, 8]
