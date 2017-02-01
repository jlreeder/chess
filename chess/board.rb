require_relative 'piece'
require 'byebug'
class Board

  PIECES = {
    Rook => [0, 7],
    Knight => [1, 6],
    Bishop => [2, 5],
    Queen => [3],
    King => [4]
  }.freeze

  SIDES = {
    top: 0,
    bottom: 7,
  }.freeze

  attr_accessor :board

  def initialize(board = Board.empty_board)
    @board = board
  end

  def self.empty_board
    Array.new(8) { Array.new(8) { NullPiece.instance } }
  end

  def setup_board
    place_non_pawns
    place_pawns

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
    pos.all? { |coord| coord.between?(0, 7) }
  end

  def piece_there?(pos)
    !self[pos].is_a?(NullPiece)
  end

  def[](pos)
    row, col = pos
    @board[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    @board[row][col] = piece
  end

  def in_check?(side)
    oppose = opposing_pieces(side)
    kingpos = king_pos(side)
    oppose.any? { |piece| piece.moves.include?(kingpos) }
  end

  def opposing_pieces(side)
    @board.flatten.select do |piece|
      piece.side != side && !piece.is_a?(NullPiece)
    end
  end

  def king_pos(side)
    king = @board.flatten.find do |piece|
      piece.side == side && piece.is_a?(King)
    end

    king.current_pos
  end

  private


  def place_non_pawns
    SIDES.each do |side, row|

      PIECES.each do |type, cols|

        cols.each do |col|
          pos = [row, col]
          self[pos] = type.new(pos, self, side)
        end

      end

    end

  end

  def place_pawns
    SIDES.each do |side, row|
      pawn_row = row + (side == :top ? 1 : -1)

      (0..7).each do |col|
        pos = pawn_row, col
        self[pos] = Pawn.new(pos, self, side)
      end
    end
  end

end
