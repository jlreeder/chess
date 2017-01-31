require "byebug"

module SteppingPiece

  def moves
    move_list = []

    move_dirs.each do |coords|
      row_mod, col_mod = coords
      curr_row, curr_col = current_pos

      possible_move = [curr_row + row_mod, curr_col + col_mod]
      next unless board.on_board?(possible_move) &&
        !board.piece_there?(possible_move)

      move_list << possible_move
    end

    move_list
  end

end
