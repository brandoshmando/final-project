class CreateEvalsAndCoursesRelationship < ActiveRecord::Migration
  def change
    create_table :courses_evals, id: false do |t|
      t.belongs_to :course
      t.belongs_to :eval
    end
  end
end
