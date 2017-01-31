require 'colorize'
require_relative 'cursor'

class Display

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    @board.board.each_with_index do |els, row|
      display_row = els.map.with_index do |el, col|
        if el.is_a?(Piece)
          @cursor.cursor_pos == [row, col] ? el.value.red : el.value
        else
          @cursor.cursor_pos == [row, col] ? '-'.red : '-'
        end
      end
      puts display_row.join(" ")
    end
    nil
  end
end
