class CreateInterviewUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :interview_users do |t|
      t.integer :user_id
      t.integer :interview_id
      t.timestamps
    end
  end
end
