require 'byebug'
module SlidingPiece

  def moves
    move_list = []

    move_dirs.each do |coords|
      curr_row, curr_col = current_pos
      row_mod, col_mod = coords
      possible_move = [curr_row + row_mod, curr_col + col_mod]
      while on_board?(possible_move)
        move_list << possible_move

        new_row, new_col = possible_move
        row_mod, col_mod = coords
        possible_move = [new_row + row_mod, new_col + col_mod]
      end
    end

    move_list
  end

  def on_board?(pos)
    pos.all? { |coord| coord.between?(0,7) }
  end
end
