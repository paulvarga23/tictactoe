class Move < ActiveRecord::Base
  attr_accessible :square, :tic_tac_toe_id, :user_id

  belongs_to :user
  belongs_to :tic_tac_toe
end
