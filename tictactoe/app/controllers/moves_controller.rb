class TicTacToesController < ApplicationController
  load_and_authorize_resource

  # def create 
  #   @move = moves.build(user_id: user.id, square: square)

  #   user = current_user

  #   @move.user_id = user.id
  #   @move.square = square

    
  #   case params[:square]
  #   when '0'
  #     tictactoe.board[0]
  #   when '1'
  #     tictactoe.board[1]
  #   when '2'
  #     tictactoe.board[2]
  #   when '3'
  #     tictactoe.board[3]
  #   when '4'
  #     tictactoe.board[4]
  #   when '5'
  #     tictactoe.board[5]
  #   when '6'
  #     tictactoe.board[6]
  #   when '7'
  #     tictactoe.board[7]
  #   when '8'
  #     tictactoe.board[8]
  #   end

  #   return move
  #   redirect_to tic_tac_toe_path(tictactoe)

  # end

end