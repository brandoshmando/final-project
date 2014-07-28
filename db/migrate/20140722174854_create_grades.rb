class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.string :title
      t.integer :final_score
      t.integer :category_id
      t.integer :student_id
      t.integer :eval_id
      t.timestamps
    end
  end
end
