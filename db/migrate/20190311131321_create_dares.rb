class CreateDares < ActiveRecord::Migration[5.2]
  def change
    create_table :dares do |t|
      t.string :title
      t.text :description
      t.belongs_to :creator, index: true
      t.belongs_to :category, index: true, foreign_key: true
      t.timestamps
    end
  end
end
