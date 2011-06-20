class CreateEssays < ActiveRecord::Migration
  def self.up
    create_table :essays do |t|
      t.string :author
      t.string :email
      t.integer :author_num
      t.string :body

      t.timestamps
    end
  end

  def self.down
    drop_table :essays
  end
end
