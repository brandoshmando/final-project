class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email,            :null => false
      t.string :crypted_password
      t.string :salt
      t.string :type


      t.timestamps
    end

    add_index :users, :email
  end
end
