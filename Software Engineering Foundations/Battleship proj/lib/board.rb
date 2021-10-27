class Board
  attr_reader :grid, :size

  # @param [Integer] n
  def initialize(n)
    @grid = Array.new(n) { Array.new([]) }
    n.times do |i|
      n.times do |j|
        grid[i][j] = :N
      end
    end
    @size = n * n
  end

  # @param [Array] arr
  def [](arr)
    grid[arr[0]][arr[1]]
  end

  # @param [Array] pos
  # @param [Symbol] value
  def []=(pos, value)
    grid[pos[0]][pos[1]] = value
  end

  def num_ships
    count = 0
    grid.each { |sub_arr| count += sub_arr.count(:S) }
    count
  end

  def attack(pos)
    if self[pos] == :S
      self[pos] = :H
      p 'you sunk my battleship!'
      true
    else
      self.[]=(pos, :X)
      false
    end
  end

  def place_random_ships
    count = 0
    grid.each { |sub_arr| count += sub_arr.count }
    place_ship = (count * 0.25).to_i
    while num_ships < place_ship
      pos_setter = [rand(0...grid.length), rand(0...grid.length)]
      self[pos_setter] = :S
    end
  end

  # @return [Array]
  def hidden_ships_grid
    res = Array.new(grid.length) { Array.new([]) }
    grid.each_with_index do |sub_arr, i|
      sub_arr.each_with_index do |ship, j|
        res[i][j] = if ship == :S
                      :N
                    else
                      ship
                    end
      end
    end
    res
  end

  # @param [Array] grid
  def self.print_grid(grid)
    grid.each do |row|
      print row.join(' ') + "\n"
    end
  end

  def cheat
    Board.print_grid(grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end
end