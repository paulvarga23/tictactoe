class TicTacToesController < ApplicationController
  load_and_authorize_resource

  def index
    @tictactoes = TicTacToe.all
  end

  def show
    @tictactoe = TicTacToe.find(params[:id])
  end

  def new
    @tictactoe = TicTacToe.new

  end

  def create 
    @tictactoe = TicTacToe.new

    @tictactoe.player1 = current_user
    @tictactoe.player2 = User.find(params[:tic_tac_toe][:player2_id])

    respond_to do |format|
      if @tictactoe.save
        format.html { redirect_to @tictactoe, notice: 'TicTacToe was successfully created.' }
      else
        format.html { render action: 'new'}
      end
    end
  end

  # def user_move
  #   user = @tictactoe.whose_turn?
  #   if @tictactoe.one_of_my_players?(user)
  #     unless @tictactoe.game_is_finished?
  #       if @tictactoe.square_is_in_range? && @tictactoe.square_is_empty?
  #         @tictactoe.make_move
  #         redirect_to @tictactoe
  #       else
  #         "You need to return a valid square"
  #       end
  #     else
  #       if @tictactoe.winning_game?
  #         #return winner
  #       else
  #         #return draw
  #       end
  #     redirect_to @tictactoe
  #     end
  #   else
  #     "You need to be Player 1 or Player 2 to play this awesome game."
  #   end
  # end

  # def computer_move

  # end
  

  def destroy
    @tictactoe = TicTacToe.find(params[:id])
    
    @tictactoe.destroy
    redirect_to(tic_tac_toes_path)
  end

#   def edit
#     @tictactoe = TicTacToe.find(params[:id])
#   end

#   def update
#     @tictactoe = TicTacToe.find(params[:id])

#     respond_to do |format|
#       if @tictactoe.update_attributes(params[:category])
#       format.html { redirect_to @tictactoe, notice: 'TicTacToe was successfully updated.' }
#       else
#       format.html { render action: "edit" }
#       end
#     end
#   end

end