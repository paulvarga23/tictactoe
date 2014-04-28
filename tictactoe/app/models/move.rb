class Move < ActiveRecord::Base
  attr_accessible :square, :tictactoe_id, :user_id

  belongs_to :user
  belongs_to :tictactoe
end
