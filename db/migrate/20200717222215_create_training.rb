class CreateTraining < ActiveRecord::Migration[6.0]
  def change
    create_table :trainings do |t|
      t.integer :user_id
      t.integer :day_id
      t.integer :exercise_id
    end
  end
end
