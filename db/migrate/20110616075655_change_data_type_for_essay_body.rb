class ChangeDataTypeForEssayBody < ActiveRecord::Migration
  def self.up
      change_table :essays do |t|
        t.change :body, :text
      end
    end

    def self.down
      change_table :essays do |t|
        t.change :body, :string
      end
    end
end
