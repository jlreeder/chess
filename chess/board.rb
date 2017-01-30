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
    board.map.with_index do |row, index|
      if not_empty_rows.include?(index)
        row.map { Piece.new }
      else
        row
      end
    end
  end
end
