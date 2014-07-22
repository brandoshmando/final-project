class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :password_digest
      t.string :type
      t.integer :course_id
      t.timestamps
    end
  end
end
