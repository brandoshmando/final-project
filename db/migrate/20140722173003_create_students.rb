class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :uid
      t.string :total_score
      t.integer :roster_id
      t.timestamps
    end
  end
end
