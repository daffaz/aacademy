class Array
  def my_each(&prc)
    length.times do |i|
      prc.call(self[i])
    end
    self
  end

  def my_select(&prc)
    new_arr = []

    my_each { |item| new_arr << item if prc.call(item) }
    new_arr
  end

  def my_reject(&prc)
    my_select { |item| !prc.call(item) }
  end

  def my_any?(&prc)
    my_each { |item| return true if prc.call(item) }
    false
  end

  def my_all?(&prc)
    my_each { |item| return false unless prc.call(item) }
    true
  end

  def my_flatten
    flattened = []
    my_each do |ele|
      if ele.instance_of?(Array)
        flattened.concat(ele.my_flatten)
      else
        flattened << ele
      end
    end
    flattened
  end

  def my_zip(*arr)
    new_arr = []

    length.times do |i|
      to_be_pushed = [self[i]]
      arr.my_each do |ele|
        to_be_pushed << ele[i]
      end
      new_arr << to_be_pushed
    end
    new_arr
  end

  def my_rotate(n = 1)
    new_arr = [*self]
    if n < 0
      cap = n * -1
      cap.times do
        popped = new_arr.pop
        new_arr = [popped, *new_arr]
      end
    else
      n.times do
        shifted = new_arr.shift
        new_arr = [*new_arr, shifted]
      end
    end
    new_arr
  end

  def my_join(newchar = '')
    new_str = ''
    length.times do |i|
      new_str += self[i]
      new_str += newchar if i != length - 1
    end
    new_str
  end

  def my_reverse
    new_arr = []
    i = length - 1
    while i >= 0
      new_arr << self[i]
      i -= 1
    end
    new_arr
  end
end
