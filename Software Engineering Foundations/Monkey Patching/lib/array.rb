# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.empty?

    self.sort!
    self[-1] - self[0]
  end

  def average
    return nil if self.empty?

    self.sum / self.length.to_f
  end

  def median
    return nil if self.empty?

    self.sort!
    if self.length.odd?
      self[self.length / 2]
    else
      (self[self.length / 2] + self[self.length / 2 - 1]) / 2.0
    end
  end

  def counts
    hash = Hash.new(0)
    self.each { |item| hash[item] += 1 }
    hash
  end

  def my_count(param)
    count = 0
    self.each { |item| count += 1 if item == param }
    count
  end

  def my_index(param)
    self.each_with_index { |item, i| return i if item == param }
    nil
  end

  def my_uniq
    result = []
    self.each { |item| result << item unless result.include?(item) }
    result
  end

  def my_transpose
    result = Array.new(self.length) { Array.new([]) }
    i = 0
    while i < self.length
      j = 0
      while j < self.length
        result[i] << self[j][i]
        j += 1
      end
      i += 1
    end
    result
  end
end