module MazeClass
  class Maze
    DELTAS = [[1, 0], [0, 1], [-1, 0], [0, -1]]

    attr_reader :start_ind, :end_ind
    def initialize(filename)
      @map = load_map(filename)
      @title = parse_title(filename)
      @start_ind = find_start
      @end_ind = find_end
    end

    def load_map(filename)
      maze = []
      File.open(filename).each_line do |line|
        chars = line.split(//)
        maze << chars
      end
      maze
    end

    def is_wall?(point)
      x, y = point
      @map[x][y] == '*'
    end

    def in_maze?(point)
      x, y = point
      not_negative = (x >= 0) && (y >= 0)
      within_bounds = (x <= @map[0].length) && (y <= @map.length)
      not_negative && within_bounds
    end

    # @param [String] filename
    def parse_title(filename)
      filename.match(/(.+)\.txt/)[1]
    end

    def to_s
      str = "MAZE: #{@title}\n"
      @map.each { |line| str << line.join('') }
      str
    end

    def find_start
      find_char("S")
    end

    def find_end
      find_char("E")
    end

    def find_char(char)
      @map.each_with_index do |line, y|
        return [line.index(char), y] if line.index(char)
      end
    end
  end
end
