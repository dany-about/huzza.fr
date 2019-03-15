class CreateUserAccomplishements < ActiveRecord::Migration[5.2]
  def change
    create_table :user_accomplishements do |t|
      t.belongs_to :user
      t.belongs_to :accomplishment
      t.timestamps
    end
  end
end
