class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :display_name
      t.string :password_digest
      t.integer :basketball_team_id
      t.integer :football_team_id 
      t.integer :baseball_team_id 
      t.integer :soccer_team_id 

      t.timestamps
    end
  end
end
