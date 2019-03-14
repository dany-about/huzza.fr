class CreateDifficultyRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :difficulty_ratings do |t|
      t.belongs_to :difficulty_rater, index:true
      t.belongs_to :dares, index: true, foreign_key: true
      t.float :rating
      t.timestamps
    end
  end
end
