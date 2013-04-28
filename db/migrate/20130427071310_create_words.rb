class CreateWords < ActiveRecord::Migration
  def up
    create_table :words do |t|
      t.string :letters
      t.string :owner
    end
  end

  def down
  end
end
