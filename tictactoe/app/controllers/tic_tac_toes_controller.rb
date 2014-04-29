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

  def user_move(user, square)
    @tictactoe.make.move
  end
  

  # def destroy
  #   @tictactoe = TicTacToe.find(params[:id])
    
  #   @tictactoe.destroy
  #   redirect_to(categories_path)
  # end

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