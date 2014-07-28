class CreateJoinTableForScoresAndComments < ActiveRecord::Migration
  def change
    create_table :comments_scores do |t|
      t.belongs_to :comment
      t.belongs_to :score
    end
  end
end

