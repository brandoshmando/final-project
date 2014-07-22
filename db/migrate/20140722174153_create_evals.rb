class CreateEvals < ActiveRecord::Migration
  def change
    create_table :evals do |t|
      t.string :title

      t.timestamps
    end
  end
end
