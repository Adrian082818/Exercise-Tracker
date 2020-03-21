class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :sets
      t.string :reps 
      t.string :weight 
      t.integer :user_id 
      t.integer :coach_id 
      t.timestamps
    end
  end
end
