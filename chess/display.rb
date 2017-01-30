require 'colorize'
require_relative 'cursor'

class Display

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    @board.board.each do |row|
      puts row.join('  ')
    end
    nil
  end

end
