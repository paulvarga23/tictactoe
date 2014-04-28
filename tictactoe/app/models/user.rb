class User < ActiveRecord::Base
  has_secure_password
  
  attr_accessible :draws, :email, :losses, :name, :password, :password_confirmation, :wins

  has_many :tictactoes_as_player1, foreign_key: "player1_id", class_name: "TicTacToe" 
  has_many :tictactoes_as_player2, foreign_key: "player2_id", class_name: "TicTacToe" 

  has_many :moves

  def role?(role)
  self.role.to_s == role.to_s
  end

end
