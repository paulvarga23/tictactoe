class TicTacToe < ActiveRecord::Base
  attr_accessible :player1_id, :player2_id, :turn, :winning_player_id

  belongs_to :player1, class_name: "User" 
  belongs_to :player2, class_name: "User" 

  has_many :moves


  #put it into the controller
  # def start_game
  #   t = TicTacToe.new
  #   current_user = t.player1
  #   @player2 = t.player2

  #   t.save
  # end

  

  def board
    result = [nil, nil, nil, nil, nil, nil, nil, nil, nil]
    moves.each do |move| 
      result[move.square] = move.user
    end
    return result
  end
  

  def make_move(user, square)
    move = moves.build(user_id: user.id, square: square)

    move.user_id = user.id
    move.square = square

    self.moves << move

  end





end
