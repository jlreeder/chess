class Piece
  attr_reader :value

  def initialize(current_pos)
    @value = "p"
    @current_pos = current_pos
  end

  def moves

  end
end

class Rook < Piece
  include SlidingPiece

  def initialize(current_pos)
    @move_dirs = [[0, 1], [1, 1], [0, -1], [-1, -1]]
  end

  protected

  attr_reader :move_dirs

end
