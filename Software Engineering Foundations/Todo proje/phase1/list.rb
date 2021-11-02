require './item'

class List
  attr_accessor :label

  def initialize(label)
    @label = label
    @items = []
  end

  def add_item(title, deadline, description = '')
    return false unless Item.valid_date?(deadline)

    @items << Item.new(title, deadline, description)
    true
  end

  def size
    @items.length
  end

  def valid_index?(index)
    index >= 0 && index < size
  end

  def swap(index_1, index_2)
    if valid_index?(index_1) && valid_index?(index_2)
      @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
      true
    else
      false
    end
  end

  def [](index)
    return nil if valid_index?(index)

    @items[index]
  end

  def priority
    @items.first
  end

  def print
    puts '--------------------------------------'
    puts '              GROCERIES               '
    puts '--------------------------------------'
    puts 'Index'.ljust(8) + '| Item'.ljust(17) + '| Deadline'
    puts '--------------------------------------'
    @items.each_with_index do |item, idx|
      puts idx.to_s.ljust(8) + '| ' + item.title.ljust(15) + '| ' + item.deadline
    end
    puts '--------------------------------------'
  end

  def print_full_item(index)
    if valid_index?(index)
      puts '--------------------------------------'
      puts "#{@items[index].title.ljust(15)} | #{@items[index].deadline}"
      puts @items[index].description
      puts '--------------------------------------'
      return true
    end
    false
  end

  def print_priority
    print_full_item(0)
  end

  def up(index, amount = 1)
    return false unless valid_index?(index)

    while amount > 0 && index != 0
      swap(index, index - 1)
      index -= 1
      amount -= 1
    end
    true
  end

  def down(index, amount = 1)
    return false unless valid_index?(index)

    while amount > 0 && index < size - 1
      swap(index, index + 1)
      amount -= 1
      index += 1
    end
    true
  end

  def sort_by_date!
    @items.sort_by! { |item| item.deadline }
  end
end
