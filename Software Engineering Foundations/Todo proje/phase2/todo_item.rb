require './list'

class TodoBoard
  def initialize(label)
    @list = {}
  end

  def get_command
    print "\nEnter a command:   "
    command, target, *args = gets.chomp.split(' ')

    case command
    when 'ls'
      @list.each_key { |key| puts "  #{key}" }
    when 'showall'
      @list.each_value(&:print)
    when 'mktodo'
      @list[target].add_item(*args)
    when 'mklist'
      @list[target] = List.new(target)
    when 'up'
      @list[target].up(*args.map(&:to_i))
    when 'down'
      @list[target].down(*args.map(&:to_i))
    when 'swap'
      @list[target].swap(*args.map(&:to_i))
    when 'toggle'
      @list[target].toggle_item(args[0].to_i)
    when 'sort'
      @list[target].sort_by_date!
    when 'priority'
      @list[target].print_priority
    when 'rm'
      @list[target].remove_item(args[0].to_i)
    when 'purge'
      @list[target].purge
    when 'print'
      if args.empty?
        @list[target].print
      else
        @list[target].print_full_item(args[0].to_i)
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
