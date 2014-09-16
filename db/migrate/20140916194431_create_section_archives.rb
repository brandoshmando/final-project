class CreateSectionArchives < ActiveRecord::Migration
  def change
    create_table :section_archives do |t|

      t.timestamps
    end
  end
end
