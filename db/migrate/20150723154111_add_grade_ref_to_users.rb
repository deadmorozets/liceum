class AddGradeRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :grade, index: true
  end
end
