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
      result[move.square] = "X" if move.user.id == player1_id
      result[move.square] = "O" if move.user.id == player2_id
    end
    return result
  end
  

  def make_move(user, square)
    move = moves.build(user_id: user.id, square: square)

    move.user_id = user.id
    move.square = square

    self.moves << move

  end

  # def winning_positions
  #   all_moves = moves.all 
  #   user_moves = moves.map { |move| move.user_id }

  #   a = user_moves[0]
  #   b = user_moves[1]
  #   c = user_moves[2]
  #   d = user_moves[3]
  #   e = user_moves[4]
  #   f = user_moves[5]
  #   g = user_moves[6]
  #   h = user_moves[7]
  #   i = user_moves[8]

  #   #horizontal winners
  #   winner_one = [a, b, c]
  #   winner_two = [d, e, f]
  #   winner_three = [g, h, i]

  #   #vertical winners
  #   winner_four = [a, d, g]
  #   winner_five = [b, e, h]
  #   winner_six = [c, f, i]

  #   #diagonal winners 
  #   winner_seven = [a, e, i]
  #   winner_eight = [g, e, c]

  #   if winner_one.uniq.size == 1 || winner_two.uniq.size == 1 || winner_three.uniq.size == 1 || winner_four.uniq.size == 1 || winner_five.uniq.size == 1 || winner_six.uniq.size == 1 || winner_seven.uniq.size == 1 || winner_eight.uniq.size == 1
  #   end


  # end
 

end
