class Stack
  def initialize
    @var = []
  end

  def push(el)
    var << el
  end

  def pop
    popped = var.pop
    "#{popped} removed"
  end

  def peek
    var.last
  end

  private

  attr_reader :var
end

class Queue
  def initialize
    var = []
  end

  def enqueue(el)
    var << el
  end

  def dequeue
    dq = var.shift
    "#{dq} dequeued"
  end

  def peek
    var.first
  end

  private

  attr_reader(:var)
end

class Map
  def initialize
    @var = []
  end

  def get(key)
    var.each { |item| return item.last if item.first == key }
    nil
  end
  [].index

  def set(key, val)
    indices = var.index { |idx| idx.first == key }
    if !indices.nil?
      var[indices][1] = val
    else
      var << [key, val]
    end
    var
  end

  def delete(key)
    var.reject! { |pair| pair.first == key }
    var
  end

  def show
    deep_dup(var)
  end

  #   [1, 2, 3, [1, 2], [4, 5]]
  def deep_dup(arr)
    arr.map do |ele|
      if ele.is_a?(Array)
        deep_dup(ele)
      else
        ele
      end
    end
  end

  private

  attr_reader :var
end
