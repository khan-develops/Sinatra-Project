class CreateWorkout < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.string :name
      t.integer :user_id
      t.integer :day_id
    end
  end
end
