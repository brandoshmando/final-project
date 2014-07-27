class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.decimal :score
      t.integer :grade_id

      t.timestamps
    end
  end
end
