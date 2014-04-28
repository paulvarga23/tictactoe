class CategoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @tictactoes = TicTacToe.all
  end

  def new
    @tictactoe = TicTacToe.new
  end

  def create 
    @tictactoe = TicTacToe.new(params[:tictactoe])

    respond_to do |format|
      if @tictactoe.save
        format.html { redirect_to @tictactoe, notice: 'TicTacToe was successfully created.' }
      else
        format.html { render action: 'new'}
      end
    end
  end

  def show
    @tictactoe = TicTacToe.find(params[:id])
  end

  def destroy
    @tictactoe = TicTacToe.find(params[:id])
    @tictactoe.destroy
    redirect_to(tictactoes_path)
  end

  def edit
    @tictactoe = TicTacToe.find(params[:id])
  end

  def update
    @tictactoe = TicTacToe.find(params[:id])

    respond_to do |format|
      if @tictactoe.update_attributes(params[:tictactoe])
      format.html { redirect_to @tictactoe, notice: 'TicTacToe was successfully updated.' }
      else
      format.html { render action: "edit" }
      end
    end
  end

  def make_move 
    @tictactoe = TicTacToe.find(params[:id])
    @new_move = @tictactoe.make_move(current_user, params[:square])
    
  end

end
