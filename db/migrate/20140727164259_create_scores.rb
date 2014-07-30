class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.string :score
      t.integer :grade_id
      t.integer :category_id
      t.timestamps
    end
  end
end
