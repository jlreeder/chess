class Piece
  attr_reader :value

  def initialize(value = "p")
    @value = value
  end

  def moves

  end
end

class Rook < Piece
  include SlidingPiece

  protected

  def move_dirs
    [[0, 1], [1, 1], [0, -1], [-1, -1]]
  end

end
