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
    not_empty_rows = [0,1 6,7]
    board.length.times do |row|
      if not_empty_rows.include?(row)
        row.map { |el| Piece.new}
      end
  end
end
