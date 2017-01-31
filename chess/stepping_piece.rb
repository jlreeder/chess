module SteppingPiece

  def moves
    move_list = []

    move_dirs.each do |coords|
      row_mod, col_mod = coords
      curr_row, curr_col = current_pos

      possible_move = [curr_row + row_mod, curr_col + col_mod]
      next unless on_board?(possible_move)

      move_list << possible_move
    end

    move_list
  end

  def on_board?(pos)
    pos.all? { |coord| coord.between?(0,7) }
  end
end
