class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.date :lesson_date
      t.belongs_to :grade
      t.belongs_to :schedule
      t.belongs_to :discipline
      t.timestamps
    end
  end
end
