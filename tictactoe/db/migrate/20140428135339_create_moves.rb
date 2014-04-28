class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.integer :tic_tac_toe_id
      t.integer :user_id
      t.integer :square

      t.timestamps
    end
  end
end
