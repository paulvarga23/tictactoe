class User < ActiveRecord::Base
  has_secure_password
  
  attr_accessible :draws, :email, :losses, :name, :password, :password_confirmation, :wins

  has_many :tictactoes_as_player1, foreign_key: "player1_id", class_name: "TicTacToe" 
  has_many :tictactoes_as_player2, foreign_key: "player2_id", class_name: "TicTacToe"
  has_many :tictactoes_as_winning_player, foreign_key: "winning_player_id", class_name: "TicTacToe" 

  has_many :moves

  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true

  
  
  def role?(role_to_compare)
    self.role.to_s == role_to_compare.to_s
  end 


  def tic_tac_toes
    TicTacToe.where('player1_id' => id) + TicTacToe.where('player2_id' => id)
  end

  def finished_tic_tac_toes
    tic_tac_toes.select do |tic_tac_toe|
      tic_tac_toe.game_is_finished? 
    end
  end

  def finished_games_drawn
    tic_tac_toes.select do |tic_tac_toe|
      tic_tac_toe.drawn_game?
    end
  end

  def finished_games_lost
    finished_tic_tac_toes - finished_games_drawn - tictactoes_as_winning_player
  end

end
