class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters do |t|
      t.integer :meet_time
      t.string :meet_day
      t.string :section_name
      t.string :location
      t.integer :course_id
      t.string :status
      t.datetime :start_date
      t.datetime :end_date
      t.timestamps
    end
  end
end
