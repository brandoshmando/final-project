class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.decimal :score

      t.timestamps
    end
  end
end
