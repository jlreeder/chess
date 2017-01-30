require_relative 'piece'

class Board

  attr_accessor :board

  def initialize(board = Board.empty_board)
    @board = board
  end

  def self.empty_board
    Array.new(8) { Array.new(8) }
  end

  def setup_board
    not_empty_rows = [0,1, 6,7]
    board.map!.with_index do |row, index|
      if not_empty_rows.include?(index)
        row.map { Piece.new }
      else
        row
      end
    end
  end

  def move_piece(start_pos, end_pos)
    moving_piece = self[start_pos]
    self[end_pos] = moving_piece
    self[start_pos] = nil
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
