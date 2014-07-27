class CreateJoinTableForGradesAndComments < ActiveRecord::Migration
  def change
    create_table :comments_grades do |t|
      t.belongs_to :comment
      t.belongs_to :grade
    end
  end
end
