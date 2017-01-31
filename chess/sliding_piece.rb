require 'byebug'
module SlidingPiece

  def moves
    move_list = []

    move_dirs.each do |coords|
      row_mod, col_mod = coords
      curr_row, curr_col = current_pos

      loop do
        possible_move = [curr_row + row_mod, curr_col + col_mod]
        break unless on_board?(possible_move)

        move_list << possible_move
        curr_row, curr_col = possible_move
      end

    end

    move_list
  end

  def on_board?(pos)
    pos.all? { |coord| coord.between?(0,7) }
  end
end
