class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.references :team, index: true
      t.references :group, index: true
      t.integer :played_games
      t.integer :winned_games
      t.integer :losed_games
      t.integer :draw_games
      t.integer :goals
      t.integer :catched_goals

      t.timestamps
    end
  end
end
