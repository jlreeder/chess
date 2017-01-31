class Piece

  MOVE_DIRS = { diagonal: [[1, 1], [1, -1], [-1, -1], [-1, 1]],
                straight: [[0, 1], [1,  0], [ 0, -1], [-1, 0]] }

  attr_reader :value, :current_pos

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
    super
    @move_dirs = [[0, 1], [1, 0], [0, -1], [-1, 0]]
  end

  protected

  attr_reader :move_dirs

end

class Bishop < Piece
  include SlidingPiece

  def initialize(current_pos)
    super
    @move_dirs = [[1, 1], [1, -1], [-1, -1], [-1, 1]]
  end

  protected

  attr_reader :move_dirs

end

class Queen < Piece
  include SlidingPiece

  def initialize(current_pos)
    super
    @move_dirs = [
                  [1, 1], [1, -1], [-1, -1], [-1, 1], # diagonal
                  [0, 1], [1,  0], [ 0, -1], [-1, 0]  # straight
    ]
  end

  protected

  attr_reader :move_dirs

end

class King < Piece
  include SlidingPiece

  def initialize(current_pos)
    super
    @move_dirs = [
                  [1, 1], [1, -1], [-1, -1], [-1, 1], # diagonal
                  [0, 1], [1,  0], [ 0, -1], [-1, 0]  # straight
    ]
  end

  protected

  attr_reader :move_dirs

end
