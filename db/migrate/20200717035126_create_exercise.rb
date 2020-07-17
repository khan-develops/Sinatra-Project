class CreateExercise < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :calorie
      t.integer :duration
      t.text :note
      t.integer :user_id
    end 
  end
end
