class CreateDifficultyRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :difficulty_ratings do |t|
      t.belongs_to :user, index:true, foreign_key: true
      t.belongs_to :dare, index: true, foreign_key: true
      t.integer :rating
      t.timestamps
    end
  end
end
