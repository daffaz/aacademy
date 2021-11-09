# n^2
# @param [Array] fish
def quadratic_biggest_fish(fishes)
  biggest = fishes.first
  i = 0
  while i < fishes.length
    j = i + 1
    while j < fishes.length
      biggest = fishes[j] if fishes[j].length > fishes[i].length
      j += 1
    end
    i += 1
  end
  biggest
end

class Array
  # n log n
  def merge_sort(&prc)
    prc ||= proc { |x, y| x <=> y }

    return self if length <= 1

    middle = length / 2
    sorted_left = take(middle).merge_sort(&prc)
    sorted_right = drop(middle).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  def self.merge(arr_left, arr_right, &prc)
    merged = []

    until arr_left.empty? || arr_right.empty?
      case prc.call(arr_left.first, arr_right.first)
      when -1
        merged << arr_left.shift
      when 0
        merged << arr_left.shift
      when 1
        merged << arr_right.shift
      end
    end

    merged.concat(arr_left)
    merged.concat(arr_right)

    merged
  end
end

food = %w[fish fiiish fiiiiish fiiiish fffish ffiiiiisshh fsh fiiiissshhhhhh]
p quadratic_biggest_fish(food)

def nlogn_biggest_fish(fishes)
  # sort the array longest to shortest
  prc = proc { |x, y| y.length <=> x.length }
  # return the first element
  fishes.merge_sort(&prc)[0]
end

# @param [Array] fishes
def smart_octopus(fishes)
  largest = fishes.first
  fishes.each { |fish| largest = fish if fish.length > largest.length }

  largest
end

tiles = %w[up right-up right right-down down left-down left left-up]

# @param [String] dir
# @param [Array] tiles
def slow_dance(dir, tiles)
  tiles.each_with_index do |tile, idx|
    return idx if tile == dir
  end

  false
end

tiles_hash = tiles.map.with_index { |ele, idx| [ele, idx] }.to_h

def fast_dance(dir, tiles_ds)
  tiles_ds[dir]
end

p nlogn_biggest_fish(food)
p smart_octopus(food)
puts

p slow_dance('up', tiles)
p slow_dance('right-down', tiles)

p fast_dance('up', tiles_hash)
p fast_dance('right-down', tiles_hash)
