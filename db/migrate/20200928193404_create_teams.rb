class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :team_name
      t.integer :sport_id
      t.string :stadium_name
      t.string :stadium_img
      t.string :website
      t.string :banner
      t.string :description
      t.string :badge
      t.string :fan_art
      t.string :jersey


      t.timestamps
    end
  end
end

