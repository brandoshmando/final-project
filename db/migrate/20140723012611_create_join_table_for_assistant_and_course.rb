class CreateJoinTableForAssistantAndCourse < ActiveRecord::Migration
  def change
    create_table :assistants_courses, id: false do |t|
      t.belongs_to :assistants
      t.belongs_to :courses
    end
  end
end
