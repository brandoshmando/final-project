class CreateEvals < ActiveRecord::Migration
  def change
    create_table :evals do |t|
      t.string :title
      t.integer :professor_id
      t.string :template
      t.timestamps
    end
  end
end
