class TicTacToesController < ApplicationController
  load_and_authorize_resource

  def index
    @tic_tac_toes_current = current_user.tic_tac_toes
    @tic_tac_toes = @tic_tac_toes.order(:created_at).page(params[:page])    
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
    if @move.save 

      if @tic_tac_toe.computer_game? && @tic_tac_toe.whose_turn? == @tic_tac_toe.player2
        @tic_tac_toe.make_computer_move! unless  @tic_tac_toe.winning_game?
      end
      
      if @tic_tac_toe.winning_game?
        @tic_tac_toe.reload
        @tic_tac_toe.winning_player_id = @tic_tac_toe.moves.last.user_id
        @tic_tac_toe.save
        flash[:notice] = "#{@tic_tac_toe.winning_player.name} has won the game"
      elsif @tic_tac_toe.drawn_game?
        flash[:notice] = "This game is a draw"
      end

    else
      flash[:error] = @move.errors.full_messages.to_sentence
    end
    redirect_to @tic_tac_toe
  end

  def destroy
    @tic_tac_toe = TicTacToe.find(params[:id])
    
    @tic_tac_toe.destroy
    redirect_to(tic_tac_toes_path)
  end


end