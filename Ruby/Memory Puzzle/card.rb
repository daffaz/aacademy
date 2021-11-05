class Card
  VALUES = ("A".."Z").to_a

  def self.shuffled_pairs(num_pairs)
    values = VALUES

    while num_pairs > values.length
      values += values
    end

    values = values.shuffle.take(num_pairs) * 2
    values.shuffle!
    values.map { |val| self.new(val) }
  end

  attr_reader :face, :revealed

  def initialize(face, revealed = false)
    @face = face
    @revealed = revealed
  end

  def hide
    @revealed = false
  end

  def reveal
    @revealed = true
  end

  def to_s
    revealed ? face.to_s : ''
  end

  def ==(obj)
    obj.is_a?(self.class) && obj.face == face
  end
end