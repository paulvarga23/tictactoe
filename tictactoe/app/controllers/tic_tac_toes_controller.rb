class TicTacToesController < ApplicationController
  load_and_authorize_resource

  def index

    @tic_tac_toes = current_user.tic_tac_toes


  end

  def show
    @tictactoe = TicTacToe.find(params[:id])
  end

  def new
    @tictactoe = TicTacToe.new

  end

  def create 
    @tictactoe = TicTacToe.new(params[:tic_tac_toe])
    @tictactoe.player1 = current_user

    respond_to do |format|
      if @tictactoe.save
        format.html { redirect_to @tictactoe, notice: 'TicTacToe was successfully created.' }
      else
        format.html { render action: 'new'}
      end
    end
  end

  def move
    @move = @tic_tac_toe.make_move(current_user, params[:square])
    unless @move.save
      flash[:error] = "Move had the following errors: " + @move.errors.full_messages.to_sentence
    end
    redirect_to @tic_tac_toe
  end

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