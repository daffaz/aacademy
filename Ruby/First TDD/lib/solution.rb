class Array
  def my_uniq
    hash = Hash.new(0)
    each { |ele| hash[ele] += 1 }

    hash.keys
  end

  def two_sum
    result = []
    each_index do |i|
      (i + 1...length).each do |j|
        result << [i, j] if self[i] + self[j] == 0
      end
    end
    result
  end

  def my_transpose
    result = Array.new(length) { Array.new([]) }
    each_index do |i|
      (0...length).each do |j|
        result[i][j] = self[j][i]
      end
    end
    result
  end
end
