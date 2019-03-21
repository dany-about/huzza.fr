class CreateContestations < ActiveRecord::Migration[5.2]
  def change
    create_table :contestations do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :participation, foreign_key: true

      t.timestamps
    end
  end
end
