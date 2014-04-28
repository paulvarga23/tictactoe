class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.integer :tictactoe_id
      t.integer :user_id
      t.integer :square

      t.timestamps
    end
  end
end
