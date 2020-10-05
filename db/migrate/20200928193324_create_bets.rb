class CreateBets < ActiveRecord::Migration[6.0]
  def change
    create_table :bets do |t|
      t.integer :user_id
      t.integer :game_id
      t.integer :team_id
      t.integer :amount

      t.timestamps
    end
  end
end
