require "byebug"

class Piece

  MOVE_DIRS = { diagonal: [[1, 1], [1, -1], [-1, -1], [-1, 1]],
                straight: [[0, 1], [1,  0], [ 0, -1], [-1, 0]] }

  attr_reader :value, :current_pos, :side, :symbol

  def initialize(current_pos, board, side)
    @current_pos = current_pos
    @board = board
    @side = side
  end

  def moves
  end

  protected

  attr_reader :move_dirs, :board

end

class Rook < Piece
  include SlidingPiece

  def initialize(current_pos, board, side)
    super
    @move_dirs = MOVE_DIRS[:straight]
    @symbol = :r
  end

end

class Bishop < Piece
  include SlidingPiece

  def initialize(current_pos, board, side)
    super
    @move_dirs = MOVE_DIRS[:diagonal]
    @symbol = :b
  end

end

class Queen < Piece
  include SlidingPiece

  def initialize(current_pos, board, side)
    super
    @move_dirs = MOVE_DIRS[:straight] + MOVE_DIRS[:diagonal]
    @symbol = :q
  end

end

class King < Piece
  include SteppingPiece

  def initialize(current_pos, board, side)
    super
    @move_dirs = MOVE_DIRS[:straight] + MOVE_DIRS[:diagonal]
    @symbol = :k
  end

end

class Knight < Piece
  include SteppingPiece

  def initialize(current_pos, board, side)
    super
    @move_dirs = [[1, 2], [2, 1], [-1, 2], [-2, 1],
                  [1, -2], [2, -1], [-1, -2], [-2, -1]]
    @symbol = :n
  end

end

class Pawn < Piece
  include SteppingPiece

  def initialize(current_pos, board, side)
    super
    @move_dirs = side == :top ? [[1, 0]] : [[-1, 0]]
    @symbol = :p
  end

end

class NullPiece < Piece
  include Singleton

  def initialize
    @symbol = ' '
    @color = :black
  end

end
