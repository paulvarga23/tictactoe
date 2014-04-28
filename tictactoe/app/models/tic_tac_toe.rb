class TicTacToe < ActiveRecord::Base
  attr_accessible :player1_id, :player2_id, :turn, :winning_player_id

  belongs_to :player1, class_name: "User" 
  belongs_to :player2, class_name: "User" 

  has_many :moves

  def start_game
    t = TicTacToe.new
    @player1 = t.player1
    @player2 = t.player2

    t.save
  end

  def board
    [ nil, nil, nil, nil, nil, nil, nil, nil, nil]
  end
  
  def make_move
    

  end

 #starting array: [ nil, nil, nil, nil, nil, nil, nil, nil, nil]
 #initialize starting: array



end
