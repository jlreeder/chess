class Piece
  attr_reader :value

  def initialize
    @value = "p"
  end

  def moves

  end
end

class Rook < Piece
  include SlidingPiece

  def initialize
    @move_dirs = [[0, 1], [1, 1], [0, -1], [-1, -1]]
  end

  protected

  attr_reader :move_dirs

end
