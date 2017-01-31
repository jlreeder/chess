module SlidingPiece

  def moves
    move_list = []

    move_dirs.each do |coords|
      curr_row, curr_col = current_pos
      row_mod, col_mod = coords
      possible_move = [curr_row + row_mod, curr_col + col_mod]
    end

    move_list
  end

end
