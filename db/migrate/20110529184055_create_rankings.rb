class CreateRankings < ActiveRecord::Migration
  def self.up
    create_table :rankings do |t|
      t.string :comment
      t.integer :score
      t.integer :essay_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :rankings
  end
end
