class CreateParticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :participations do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :dares
      t.datetime :deadline
      t.boolean :is_achieved, default: false
      t.timestamps
    end
  end
end
