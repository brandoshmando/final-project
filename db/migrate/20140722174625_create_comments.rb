class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :description

      t.timestamps
    end
  end
end
