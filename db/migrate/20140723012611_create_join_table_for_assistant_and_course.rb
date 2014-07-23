class CreateJoinTableForAssistantAndCourse < ActiveRecord::Migration
  def change
    create_table :assistants_courses, id: false do |t|
      t.belongs_to :assistant
      t.belongs_to :course
    end
  end
end
