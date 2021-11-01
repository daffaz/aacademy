class Board
  def initialize
    @grid = Array.new(3) { Array.new(3, '_') }
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def valid?(pos)
    !self[pos].nil? && pos.all? { |ele| ele >= 0 }
  end

  def empty?(pos)
    self.[](pos) == '_'
  end

  def place_mark(pos, mark)
    raise 'invalid mark (already marked or not valid position)' if !valid?(pos) || !empty?(pos)

    self.[]=(pos, mark)
  end

  def print
    puts
    @grid.each do |row|
      puts row.join('  ')
      puts
    end
    puts
  end

  def win_row?(mark)
    @grid.each do |row|
      count = 0
      row.each do |col|
        count += 1 if col == mark
      end
      return true if count == 3
    end
    false
  end

  def win_col?(mark)
    transpose_grid = @grid.transpose
    transpose_grid.each do |row|
      count = 0
      row.each do |col|
        count += 1 if col == mark
      end
      return true if count == 3
    end
    false
  end

  def win_diagonal?(mark)
    diag = []
    anti_diag = []
    @grid.each_with_index do |row, i|
      diag << row[i]
      anti_diag << row[-i - 1]
    end
    diag.all?(mark) || anti_diag.all?(mark)
  end

  def win?(mark)
    win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
  end

  def empty_positions?
    @grid.any? { |row| row.any? { |ele| ele == '_' } }
  end
end
