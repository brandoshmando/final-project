class CreateRostersStudentsJoinTable < ActiveRecord::Migration
  def change
    create_table :rosters_students, id: false do |t|
      t.belongs_to :roster
      t.belongs_to :student
    end

  end
end
