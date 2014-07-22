class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.decimal :final_score
      t.string :template
      t.integer :student_id
      t.integer :eval_id
      t.timestamps
    end
  end
end
