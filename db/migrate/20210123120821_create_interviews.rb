class CreateInterviews < ActiveRecord::Migration[6.0]
  def change
    create_table :interviews do |t|
      t.datetime :starttime
      t.datetime :endtime
      t.timestamps
    end
  end
end
