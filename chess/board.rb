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
    board.map!.with_index do |els, row|
      if not_empty_rows.include?(row)
        els.map.with_index do |el, col|
          Piece.new([row, col])
        end
      else
        els
      end
    end
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
