require './list'

class TodoBoard
  def initialize(label)
    @list = List.new(label)
  end

  def get_command
    print "\nEnter a command:   "
    command, *args = gets.chomp.split(' ')

    case command
    when 'mktodo'
      @list.add_item(*args)
    when 'up'
      @list.up(*args.map(&:to_i))
    when 'down'
      @list.down(*args.map(&:to_i))
    when 'swap'
      @list.swap(*args.map(&:to_i))
    when 'sort'
      @list.sort_by_date!
    when 'priority'
      @list.print_priority
    when 'print'
      if args.empty?
        @list.print
      else
        @list.print_full_item(args[0].to_i)
      end
    when 'quit'
      return false
    else
      print 'Sorry, command not recognized'
    end

    true
  end

  def run
    return unless get_command while true
  end
end
