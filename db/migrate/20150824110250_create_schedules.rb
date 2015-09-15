class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :order
      t.time :start

      t.timestamps
    end
  end
end
