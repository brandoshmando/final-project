class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.string :title
      t.string :final_score
      t.string :max_score
      t.string :template
      t.integer :user_id
      t.integer :student_id
      t.integer :eval_id
      t.timestamps
    end
  end
end
