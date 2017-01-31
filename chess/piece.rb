require "byebug"

class Piece

  MOVE_DIRS = { diagonal: [[1, 1], [1, -1], [-1, -1], [-1, 1]],
                straight: [[0, 1], [1,  0], [ 0, -1], [-1, 0]] }

  attr_reader :value, :current_pos

  def initialize(current_pos, board)
    @value = "p"
    @current_pos = current_pos
    @board = board
  end

  def moves
  end
end

class Rook < Piece
  include SlidingPiece

  def initialize(current_pos, board)
    super
    @move_dirs = MOVE_DIRS[:straight]
  end

  protected

  attr_reader :move_dirs

end

class Bishop < Piece
  include SlidingPiece

  def initialize(current_pos, board)
    super
    @move_dirs = MOVE_DIRS[:diagonal]
  end

  protected

  attr_reader :move_dirs

end

class Queen < Piece
  include SlidingPiece

  def initialize(current_pos, board)
    super
    @move_dirs = MOVE_DIRS[:straight] + MOVE_DIRS[:diagonal]
  end

  protected

  attr_reader :move_dirs

end

class King < Piece
  include SteppingPiece

  def initialize(current_pos, board)
    super
    @move_dirs = MOVE_DIRS[:straight] + MOVE_DIRS[:diagonal]
  end

  protected

  attr_reader :move_dirs

end

class Knight < Piece
  include SteppingPiece

  def initialize(current_pos, board)
    super
    @move_dirs = [[1, 2], [2, 1], [-1, 2], [-2, 1],
                  [1, -2], [2, -1], [-1, -2], [-2, -1]]
  end

  protected

  attr_reader :move_dirs

end
