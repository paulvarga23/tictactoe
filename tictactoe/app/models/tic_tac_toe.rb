class TicTacToe < ActiveRecord::Base
  attr_accessible :player1_id, :player2_id, :turn, :winning_player_id, :player2

  belongs_to :player1, class_name: "User" 
  belongs_to :player2, class_name: "User" 

  has_many :moves
  

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

    return move
  end

  def square_is_in_range?(square)
    square >= 0 && square <= 8
  end

  def square_is_empty?(square)
    board[square] == nil
  end

  def one_of_my_players?(user)
  player1 == user || player2 == user
  end

  def whose_turn?
  return player1 if moves.empty?
  moves.last.user == player1 ? player2 : player1
  end

  def winning_move_positions
  [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  end
 
  def winning_game?
  !!winning_move_positions.detect do |winning_move|
    board_sub_set = winning_move.map { |square| board[square] }
    board_sub_set.any? && board_sub_set.uniq.size == 1
    end
  end

  def drawn_game?
  board.all? && !winning_game?
  end

  def game_is_finished?
  winning_game? || drawn_game?
  end

  



end
