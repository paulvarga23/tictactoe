class TicTacToesController < ApplicationController
  load_and_authorize_resource

  def index
    @tictactoes = TicTacToe.all
  end

#   def new
#     @tictactoe = TicTacToe.new
#   end

#   def create 
#     @tictactoe = TicTacToe.new(params[:category])

#     respond_to do |format|
#       if @tictactoe.save
#         format.html { redirect_to @tictactoe, notice: 'TicTacToe was successfully created.' }
#       else
#         format.html { render action: 'new'}
#       end
#     end
#   end

#   def show
#     @tictactoe = TicTacToe.find(params[:id])
#   end

#   def destroy
#     @tictactoe = TicTacToe.find(params[:id])
#     @tictactoe.destroy
#     redirect_to(categories_path)
#   end

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