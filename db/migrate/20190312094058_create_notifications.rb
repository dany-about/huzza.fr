class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :friend, index: true
      t.references :event, polymorphic: true, index: true
      t.string :occasion
      t.boolean :read, default: false
      t.timestamps
    end
  end
end
