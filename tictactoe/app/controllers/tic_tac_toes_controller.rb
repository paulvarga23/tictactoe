class TicTacToesController < ApplicationController
  load_and_authorize_resource

  def index
    @tic_tac_toes = current_user.tic_tac_toes
  end

  def show
    @tic_tac_toe = TicTacToe.find(params[:id])
  end

  def new
    @tic_tac_toe = TicTacToe.new

  end

  def create 
    @tic_tac_toe = TicTacToe.new(params[:tic_tac_toe])
    @tic_tac_toe.player1 = current_user

    respond_to do |format|
      if @tic_tac_toe.save
        format.html { redirect_to @tic_tac_toe, notice: 'TicTacToe was successfully created' }
      else
        format.html { render action: 'new'}
      end
    end
  end

  def move
    @move = @tic_tac_toe.make_move(current_user, params[:square])
    if @move.save && @tic_tac_toe.winning_game?
      @tic_tac_toe.winning_player_id = @move.user_id
      @tic_tac_toe.save
      flash[:notice] = "#{@move.user.name} has won the game"
    elsif @move.save && @tic_tac_toe.drawn_game?
      flash[:notice] = "This game is a draw"
    else
      flash[:error] = @move.errors.full_messages.to_sentence
    end
    redirect_to @tic_tac_toe
  end

  # def computer_move

    #random move rand(8)

    #if player1 equals two of winning column hinder them

    #if player1 !!plays 5 play5 and then 4 or 6

    #if player1 plays 5 play corner, if player1 plays corner play corner 


  # end
  

  def destroy
    @tic_tac_toe = TicTacToe.find(params[:id])
    
    @tic_tac_toe.destroy
    redirect_to(tic_tac_toes_path)
  end

#   def edit
#     @tic_tac_toe = TicTacToe.find(params[:id])
#   end

#   def update
#     @tic_tac_toe = TicTacToe.find(params[:id])

#     respond_to do |format|
#       if @tic_tac_toe.update_attributes(params[:category])
#       format.html { redirect_to @tic_tac_toe, notice: 'TicTacToe was successfully updated.' }
#       else
#       format.html { render action: "edit" }
#       end
#     end
#   end

end