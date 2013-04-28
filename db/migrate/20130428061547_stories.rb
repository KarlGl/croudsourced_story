class Stories < ActiveRecord::Migration
  def up
    create_table :stories do |t|
      t.string :text
    end
  end
  def down
  end
end
