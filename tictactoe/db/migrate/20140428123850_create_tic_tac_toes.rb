class CreateTicTacToes < ActiveRecord::Migration
  def change
    create_table :tic_tac_toes do |t|
      t.integer :player1_id
      t.integer :player2_id
      t.integer :winning_player_id
      t.string :turn

      t.timestamps
    end
  end
end
