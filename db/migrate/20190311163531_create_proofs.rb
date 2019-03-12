class CreateProofs < ActiveRecord::Migration[5.2]
  def change
    create_table :proofs do |t|
      t.belongs_to :participation, index: true, foreign_key: true

      t.timestamps
    end
  end
end
