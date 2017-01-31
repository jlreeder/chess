require_relative 'piece'

class Board

  PIECES = {
    Rook => [0, 7],
    Knight => [1, 6],
    Bishop => [2, 5],
    Queen => [3],
    King => [4]
  }.freeze

  attr_accessor :board

  def initialize(board = Board.empty_board)
    @board = board
  end

  def self.empty_board
    Array.new(8) { Array.new(8) }
  end

  def setup_board

    [0, 7].each do |row|

      PIECES.each do |type, cols|

        cols.each do |col|
          pos = [row, col]
          self[pos] = type.new(pos, self)
        end

      end

    end

    nil
  end

  def move_piece(start_pos, end_pos)
    moving_piece = self[start_pos]
    self[end_pos] = moving_piece
    self[start_pos] = nil
  end

  def valid_move?(start_pos, end_pos)
    return false unless on_board?(start_pos) && on_board?(end_pos)
    piece_there?(start_pos) && !piece_there?(end_pos)
  end

  def on_board?(pos)
    pos.all? { |coord| coord.between?(0,7) }
  end

  def piece_there?(pos)
    !self[pos].nil?
  end

  def[](pos)
    row, col = pos
    @board[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    @board[row][col] = piece
  end

end
