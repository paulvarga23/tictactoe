class Move < ActiveRecord::Base
  attr_accessible :square, :tic_tac_toe_id, :user_id

  belongs_to :user
  belongs_to :tic_tac_toe

  validates :user, presence: true
  validates :tic_tac_toe, presence: true
  validates :square, presence: true

  validate :game_over
  validate :insure_player_is_playing
  validate :insure_player_is_allowed_to_turn
  validate :insure_square_is_valid
  validate :insure_square_is_empty

  private
  def insure_base_is_allowed_to_turn
    errors.add(:base, 'It is not your turn.') if ti
  end

  private
  def game_over
    errors.add(:base, 'Game over.') if tic_tac_toe.game_is_finished?
  end

  private
  def insure_player_is_playing
    errors.add(:base, 'Player is not active.') unless tic_tac_toe.one_of_my_players?(user)
  end

  private
  def insure_player_is_allowed_to_turn
    errors.add(:base, 'It is not your turn.') unless user == tic_tac_toe.whose_turn?
  end

  private
  def insure_square_is_valid
    errors.add(:square, 'is not in range.') unless tic_tac_toe.square_is_in_range?(square)
  end

  private 
  def insure_square_is_empty
    errors.add(:square, 'is not empty.') unless tic_tac_toe.square_is_empty?(square)
  end


end
